import 'dart:async';
import 'dart:io';

import 'package:auto_login_flutter/localizations.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dscript_exec/dscript_exec.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi/wifi.dart';

import 'http_resquests.dart';

Future<String> diagnose(BuildContext context) async {
  var out = "";
  Map<String, String> diagnosis = {};

  const argsPing = "-c 4 -w 5 -W 5";

  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    String ssid;
    PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location)
        .then((answer) {
      if (answer == PermissionStatus.granted)
        Connectivity().getWifiName().then((out) => ssid = out);
      else
        PermissionHandler().requestPermissions([PermissionGroup.location]);
    });
    var level = await Wifi.level;
    var ip = await Wifi.ip;

    diagnosis["SSID"] = ssid;
    diagnosis["Level"] = '$level';
    diagnosis["IP"] = ip;

      exec("ip", [
        'a',
      ]).runGetOutput().then(
          (out) => diagnosis["ip a"] = out.isEmpty ? "Nothing to show" : out);
      exec("ifconfig", [
        '-a',
      ]).runGetOutput().then((out) =>
          diagnosis["ifconfig"] = out.isEmpty ? "Nothing to show" : out);
      exec("arp", [
        '-a',
      ])
          .runGetOutput()
          .then(
              (out) => diagnosis["arp"] = out.isEmpty ? "Nothing to show" : out)
          .catchError((out) => diagnosis["arp"] = out.toString());
      exec("su", [
        '-c',
        'traceroute',
        'google.com',
      ])
          .runGetOutput()
          .then((out) =>
              diagnosis["traceroute"] = out.isEmpty ? "Nothing to show" : out)
          .catchError((out) => diagnosis["traceroute"] = out.toString());
      exec("su", [
        '-c',
        'traceroute',
        '8.8.8.8',
      ])
          .runGetOutput()
          .then((out) => diagnosis["traceroute Google"] =
              out.isEmpty ? "Nothing to show" : out)
          .catchError((out) => diagnosis["traceroute Google"] = out.toString());
      exec("ping", [argsPing, "127.0.0.1"]).runGetOutput().then(
          (out) => diagnosis["pingLo"] = out.isEmpty ? "Nothing to show" : out);
      exec("ping", [argsPing, "10.163.0.5"]).runGetOutput().then((out) =>
          diagnosis["pingLocal"] = out.isEmpty ? "Nothing to show" : out);
      exec("ping", [argsPing, "10.163.0.2"]).runGetOutput().then((out) =>
          diagnosis["pingGateway"] = out.isEmpty ? "Nothing to show" : out);
      exec("ping", [argsPing, "192.168.130.33"]).runGetOutput().then((out) =>
          diagnosis["pingDNS1"] = out.isEmpty ? "Nothing to show" : out);
      exec("ping", [argsPing, "192.168.130.3"]).runGetOutput().then((out) =>
          diagnosis["pingDNS2"] = out.isEmpty ? "Nothing to show" : out);
      exec("ping", [argsPing, "8.8.8.8"]).runGetOutput().then((out) =>
          diagnosis["pingDNS3"] = out.isEmpty ? "Nothing to show" : out);
      exec("ping", [argsPing, "1.1.1.1"]).runGetOutput().then((out) =>
          diagnosis["pingDNS4"] = out.isEmpty ? "Nothing to show" : out);
      exec("ping", [argsPing, "10.163.0.6"]).runGetOutput().then((out) =>
          diagnosis["pingDNS5"] = out.isEmpty ? "Nothing to show" : out);
      exec("nslookup", ["fw-cgcp.emse.fr"])
          .runGetOutput()
          .then((out) => diagnosis["nsLookupEMSEBusybox"] =
              out.isEmpty ? "Nothing to show" : out)
          .catchError(
              (out) => diagnosis["nsLookupEMSEBusybox"] = out.toString());
      exec("nslookup", ["google.com"])
          .runGetOutput()
          .then((out) => diagnosis["nsLookupGoogleBusybox"] =
              out.isEmpty ? "Nothing to show" : out)
          .catchError(
              (out) => diagnosis["nsLookupGoogleBusybox"] = out.toString());
      getStatus("195.83.139.7").then((status) => diagnosis["statusPublic"] =
          status.isEmpty ? "Nothing to show" : status);
      getStatus("10.163.0.2").then((status) =>
          diagnosis["statusGateway"] = status.isEmpty ? "Nothing to show" : status);
      InternetAddress.lookup("fw-cgcp.emse.fr")
          .then((addresses) => addresses.forEach((address) =>
              diagnosis["nsLookupEMSE"] =
                  "Host: ${address.host}\nLookup: ${address.address}"))
          .catchError((e) => diagnosis["nsLookupEMSE"] = e.toString());
      InternetAddress.lookup("google.com")
          .then((addresses) => addresses.forEach((address) =>
              diagnosis["nsLookupGoogle"] =
                  "Host: ${address.host}\nLookup: ${address.address}"))
          .catchError((e) => diagnosis["nsLookupGoogle"] = e.toString());
    await Future.delayed(const Duration(minutes: 1));

    out =
        "\n*SSID: ${diagnosis["SSID"]}, Level: ${diagnosis["Level"]}, Ip: ${diagnosis["IP"]}*\n\n"
        "*ip a:* \n${diagnosis["ip a"]}\n\n"
        "*ifconfig:* \n${diagnosis["ifconfig"]}\n\n"
        "*ARP:* \n${diagnosis["arp"]}\n\n"
        "*Traceroute Google:* \n${diagnosis["traceroute"]}\n\n"
        "*Traceroute Google DNS:* \n${diagnosis["traceroute Google"]}\n\n"
        "*Ping Loopback:* \n${diagnosis["pingLo"]}\n\n"
        "*Ping Local:* \n${diagnosis["pingLocal"]}\n\n"
        "*HTTP Portal Response Public:* \n${diagnosis["statusPublic"]}\n\n"
        "*HTTP Portal Response Gateway:* \n${diagnosis["statusGateway"]}\n\n"
        "*Ping Gateway:* \n${diagnosis["pingGateway"]}\n\n"
        "*Ping DNS1:* \n${diagnosis["pingDNS1"]}\n\n"
        "*Ping DNS2:* \n${diagnosis["pingDNS2"]}\n\n"
        "*Ping DNS3:* \n${diagnosis["pingDNS3"]}\n\n"
        "*Ping DNS4:* \n${diagnosis["pingDNS4"]}\n\n"
        "*Ping DNS5:* \n${diagnosis["pingDNS5"]}\n\n"
        "*NSLookup EMSE:* \n${diagnosis["nsLookupEMSE"]}\n\n"
        "*NSLookup Google:* \n${diagnosis["nsLookupGoogle"]}\n\n"
        "*NSLookup EMSE (Busybox):* \n${diagnosis["nsLookupEMSEBusybox"]}\n\n"
        "*NSLookup Google (Busybox):* \n${diagnosis["nsLookupGoogleBusybox"]}\n\n";
  } else
    out = AppLoc.of(context).sentenceNotConnected;

  return out;
}
