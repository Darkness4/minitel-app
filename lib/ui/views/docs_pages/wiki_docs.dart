import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';

import 'wiki_docs/dualboot_doc.dart';
import 'wiki_docs/imprimante_doc.dart';
import 'wiki_docs/mail_doc.dart';
import 'wiki_docs/virtual_machines_doc.dart';

class WikiDocs extends StatelessWidget {
  final PageController _controller;
  const WikiDocs({Key key, PageController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wiki Documentation"),
      ),
      body: Scrollbar(
        child: PageView(
          key: const Key('wiki_docs/pages'),
          controller: _controller,
          children: const <Widget>[
            ImprimanteDoc(key: Key('wiki_docs/imprimante')),
            MailDoc(key: Key('wiki_docs/mail')),
            DualBootDoc(key: Key('wiki_docs/dualboot')),
            VirtMachineDoc(key: Key('wiki_docs/vm')),
          ],
        ),
      ),
      endDrawer: DocsDrawer(DocsPageId.Wiki, controller: _controller),
    );
  }
}
