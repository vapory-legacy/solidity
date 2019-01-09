Solidity
========

.. image:: logo.svg
    :width: 120px
    :alt: Solidity logo
    :align: center

Solidity is a contract-oriented, high-level language for implementing smart contracts.
It was influenced by C++, Python and JavaScript
and is designed to target the Vapory Virtual Machine (VVM).

Solidity is statically typed, supports inheritance, libraries and complex
user-defined types among other features.

As you will see, it is possible to create contracts for voting,
crowdfunding, blind auctions, multi-signature wallets and more.

.. note::
    The best way to try out Solidity right now is using
    `Remix <https://remix.vapory.org/>`_
    (it can take a while to load, please be patient).

Translations
------------

This documentation is translated into several languages by community volunteers, but the English version stands as a reference.

* `Spanish <https://solidity-es.readthedocs.io>`_
* `Russian <https://github.com/vaporyco/wiki/wiki/%5BRussian%5D-%D0%A0%D1%83%D0%BA%D0%BE%D0%B2%D0%BE%D0%B4%D1%81%D1%82%D0%B2%D0%BE-%D0%BF%D0%BE-Solidity>`_ (rather outdated)


Useful links
------------

* `Vapory <https://vapory.org>`_

* `Changelog <https://github.com/vaporyco/solidity/blob/develop/Changelog.md>`_

* `Story Backlog <https://www.pivotaltracker.com/n/projects/1189488>`_

* `Source Code <https://github.com/vaporyco/solidity/>`_

* `Vapory Stackexchange <https://vapory.stackexchange.com/>`_

* `Gitter Chat <https://gitter.im/vapory/solidity/>`_

Available Solidity Integrations
-------------------------------

* `Remix <https://remix.vapory.org/>`_
    Browser-based IDE with integrated compiler and Solidity runtime environment without server-side components.

* `IntelliJ IDEA plugin <https://plugins.jetbrains.com/plugin/9475-intellij-solidity>`_
    Solidity plugin for IntelliJ IDEA (and all other JetBrains IDEs)

* `Visual Studio Extension <https://visualstudiogallery.msdn.microsoft.com/96221853-33c4-4531-bdd5-d2ea5acc4799/>`_
    Solidity plugin for Microsoft Visual Studio that includes the Solidity compiler.

* `Package for SublimeText — Solidity language syntax <https://packagecontrol.io/packages/Vapory/>`_
    Solidity syntax highlighting for SublimeText editor.

* `Vaporatom <https://github.com/0mkara/vaporatom>`_
    Plugin for the Atom editor that features syntax highlighting, compilation and a runtime environment (Backend node & VM compatible).

* `Atom Solidity Linter <https://atom.io/packages/linter-solidity>`_
    Plugin for the Atom editor that provides Solidity linting.

* `Atom Solium Linter <https://atom.io/packages/linter-solium>`_
    Configurable Solidty linter for Atom using Solium as a base.

* `Solium <https://github.com/duaraghav8/Solium/>`_
    A commandline linter for Solidity which strictly follows the rules prescribed by the `Solidity Style Guide <http://solidity.readthedocs.io/en/latest/style-guide.html>`_.
    
* `Solhint <https://github.com/protofire/solhint>`_
    Solidity linter that provides security, style guide and best practice rules for smart contract validation.

* `Visual Studio Code extension <http://juan.blanco.ws/solidity-contracts-in-visual-studio-code/>`_
    Solidity plugin for Microsoft Visual Studio Code that includes syntax highlighting and the Solidity compiler.

* `Emacs Solidity <https://github.com/vaporyco/emacs-solidity/>`_
    Plugin for the Emacs editor providing syntax highlighting and compilation error reporting.

* `Vim Solidity <https://github.com/tomlion/vim-solidity/>`_
    Plugin for the Vim editor providing syntax highlighting.

* `Vim Syntastic <https://github.com/scrooloose/syntastic>`_
    Plugin for the Vim editor providing compile checking.

Discontinued:

* `Mix IDE <https://github.com/vaporyco/mix/>`_
    Qt based IDE for designing, debugging and testing solidity smart contracts.

* `Vapory Studio <https://live.vapor.camp/>`_		
    Specialized web IDE that also provides shell access to a complete Vapory environment.

Solidity Tools
--------------

* `Dapp <https://dapp.readthedocs.io>`_
    Build tool, package manager, and deployment assistant for Solidity.

* `Solidity REPL <https://github.com/raineorshine/solidity-repl>`_
    Try Solidity instantly with a command-line Solidity console.

* `solgraph <https://github.com/raineorshine/solgraph>`_
    Visualize Solidity control flow and highlight potential security vulnerabilities.

* `vvmdis <https://github.com/Arachnid/vvmdis>`_
    VVM Disassembler that performs static analysis on the bytecode to provide a higher level of abstraction than raw VVM operations.

* `Doxity <https://github.com/DigixGlobal/doxity>`_
    Documentation Generator for Solidity.

Third-Party Solidity Parsers and Grammars
-----------------------------------------

* `solidity-parser <https://github.com/ConsenSys/solidity-parser>`_
    Solidity parser for JavaScript

* `Solidity Grammar for ANTLR 4 <https://github.com/federicobond/solidity-antlr4>`_
    Solidity grammar for the ANTLR 4 parser generator

Language Documentation
----------------------

On the next pages, we will first see a :ref:`simple smart contract <simple-smart-contract>` written
in Solidity followed by the basics about :ref:`blockchains <blockchain-basics>`
and the :ref:`Vapory Virtual Machine <the-vapory-virtual-machine>`.

The next section will explain several *features* of Solidity by giving
useful :ref:`example contracts <voting>`
Remember that you can always try out the contracts
`in your browser <https://remix.vapory.org>`_!

The last and most extensive section will cover all aspects of Solidity in depth.

If you still have questions, you can try searching or asking on the
`Vapory Stackexchange <https://vapory.stackexchange.com/>`_
site, or come to our `gitter channel <https://gitter.im/vapory/solidity/>`_.
Ideas for improving Solidity or this documentation are always welcome!

Contents
========

:ref:`Keyword Index <genindex>`, :ref:`Search Page <search>`

.. toctree::
   :maxdepth: 2

   introduction-to-smart-contracts.rst
   installing-solidity.rst
   solidity-by-example.rst
   solidity-in-depth.rst
   security-considerations.rst
   using-the-compiler.rst
   metadata.rst
   abi-spec.rst
   julia.rst
   style-guide.rst
   common-patterns.rst
   bugs.rst
   contributing.rst
   frequently-asked-questions.rst
