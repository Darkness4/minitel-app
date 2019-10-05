import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:minitel_toolbox/ui/widgets/docs_widgets.dart';

class DualBootDoc extends StatelessWidget {
  const DualBootDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          BoxMdH(AppLoc.of(context).docs.dualboot.header, 1),
          Text(
            AppLoc.of(context).docs.dualboot.infos,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Center(
            child: RaisedButton(
              onPressed: LaunchURL.dualBootTutorial,
              child: const Text("Full Tutorial Dual Boot"),
            ),
          ),
          Text.rich(
            TextSpan(
              style: Theme.of(context).textTheme.body2,
              children: <TextSpan>[
                TextSpan(
                  text: AppLoc.of(context).docs.dualboot.risksHeader,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.dualboot.risksContent,
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ],
                ),
                TextSpan(
                  text: AppLoc.of(context).docs.dualboot.customizeHeader,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.dualboot.customizeContent,
                      style: Theme.of(context).textTheme.body1,
                    )
                  ],
                ),
                TextSpan(
                  text: AppLoc.of(context).docs.dualboot.prepHeader,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.dualboot.prepContent,
                      style: Theme.of(context).textTheme.body1,
                    )
                  ],
                ),
                TextSpan(
                  text: AppLoc.of(context).docs.dualboot.installHeader,
                  style: Theme.of(context).textTheme.body2,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.dualboot.installContent,
                      style: Theme.of(context).textTheme.body1,
                    )
                  ],
                ),
                TextSpan(
                  text: "Known Issue : NVIDIA + Intel Graphics:\n",
                  style: Theme.of(context).textTheme.body2,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.dualboot.issue1Content,
                      style: Theme.of(context).textTheme.body1,
                    )
                  ],
                ),
              ],
            ),
          ),
          const LogCard(
            "linux /boot/vmlinuz-2.6.31-9 root=UUID=904bf39-9234 ro nomodeset\n",
            title: "GNU GRUB",
          ),
          Text.rich(
            TextSpan(
              text: "Known Issue : Post-Install (NVIDIA + Intel Graphics) :\n",
              style: Theme.of(context).textTheme.body2,
              children: <TextSpan>[
                TextSpan(
                  text: AppLoc.of(context).docs.dualboot.issue2Content1,
                  style: Theme.of(context).textTheme.body1,
                ),
                TextSpan(
                  text: AppLoc.of(context).docs.dualboot.issue2Content2,
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            ),
          ),
          const LogCard(
            "sudo service lightdm stop  # ou gdm, gdm3, lxdm",
            title: "Shell - Stop Display Manager",
          ),
          const LogCard(
            "sudo nano /etc/init/gpu-manager.conf  # May not exists",
            title: "Shell - Comment all",
          ),
          const LogCard(
            "sudo prime-select nvidia  # May not exists",
            title: "Shell - Select NVIDIA",
          ),
          const LogCard(
            "sudo nano /etc/modprobe.d/blacklist-nouveau.conf",
            title: "Shell - Blacklist nouveau drivers",
          ),
          const LogCard(
            """blacklist nouveau
blacklist lbm-nouveau
options nouveau modeset=0
alias nouveau off
alias lbm-nouveau off""",
            title: "nano /etc/modprobe.d/blacklist-nouveau.conf",
          ),
          const LogCard(
            """sudo update-initramfs -u""",
            title: "Shell - Update the filesystem mounter",
          ),
          const LogCard(
            "sudo bash ./NVIDIA-*.run --no-opengl-files",
            title: "Shell - Install NVIDIA drivers",
          ),
          const LogCard(
            "sudo bash ./cuda_*_linux.run  # Without OpenGL, with CUDA Toolkit",
            title: "Shell - Install CUDA (if Tensorflow)",
          ),
          Text(AppLoc.of(context).docs.dualboot.issue2Content3),
          const LogCard(
            "sudo nano /etc/default/grub",
            title: "Shell - Change Grub",
          ),
          const LogCard(
            """GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
GRUB_HIDDEN_TIMEOUT=5
GRUB_HIDDEN_TIMEOUT_QUIET=false
GRUB_TIMEOUT=0
GRUB_CMDLINE_LINUX_DEFAULT=\"\"
GRUB_TERMINAL=console""",
            title: "nano /etc/default/grub - Change Grub",
          ),
          const LogCard(
            "sudo update-grub",
            title: "Shell - Update Grub",
          ),
          Text.rich(
            TextSpan(
              text: AppLoc.of(context).docs.dualboot.changeLinuxHeader,
              style: Theme.of(context).textTheme.body2,
              children: <TextSpan>[
                TextSpan(
                  text: AppLoc.of(context).docs.dualboot.changeLinuxContent,
                  style: Theme.of(context).textTheme.body1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
