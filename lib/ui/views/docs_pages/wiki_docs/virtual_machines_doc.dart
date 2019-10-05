import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/docs_widgets.dart';

class VirtMachineDoc extends StatelessWidget {
  const VirtMachineDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          const BoxMdH("Virtual Machines", 1),
          Text.rich(
            TextSpan(
              style: Theme.of(context).textTheme.body2,
              children: <TextSpan>[
                TextSpan(
                  text: AppLoc.of(context).docs.vm.definitionHeader,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.vm.definitionContent,
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ],
                ),
                TextSpan(
                  text: AppLoc.of(context).docs.vm.customizeHeader,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.vm.customizeContent,
                    ),
                  ],
                ),
                TextSpan(
                  text: AppLoc.of(context).docs.vm.installHeader,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.vm.installContent,
                    ),
                  ],
                ),
                TextSpan(
                  text: AppLoc.of(context).docs.vm.vmTypeHeader,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.vm.vmTypeContent,
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ],
                ),
                TextSpan(
                  text: AppLoc.of(context).docs.vm.hypervisorHeader,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.vm.hypervisorContent,
                    ),
                  ],
                ),
                TextSpan(
                  text: AppLoc.of(context).docs.vm.envHeader,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.vm.envContent,
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ],
                ),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
