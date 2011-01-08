---
layout: default
title: Localizations
---

A guide to package localization files using PackageMaker

1.  Start the program, PackageMaker located in
    `/Developer/Applications/Utilities/`. If this folder is not present,
    you need to install the XCode package on the OS X installation DVD.
2.  Press the 'Assist Me...' button to begin building the package.
3.  Type in an appropriate title (e.g. Japanese localization for iTerm)
    and an organization.  You can type in a single space for the organization
    name to continue on.  Do not click on the 'Support 10.3.x and 10.2.x'
    checkbox.  Press the 'Continue' button.
    ![Package Setup Assistant - Welcome](/images/localization/package.png)
4.  Press the '+' button located right above the 'Source' box to add
    localization folders you have created.  In the search field, type
    `/Applications/iTerm.app/Contents/`
    ![Go To Folder](/images/localization/go-folder.png)
    and press the 'Go' button.  Contents within this folder should show up
    in the file selection window.
    ![Contents Folder](/images/localization/folder-contents.png)
    Go into the 'Resources' folder, select the localization folder you have
    created, and press the 'Open' button.
    ![Resources Folder](/images/localization/folder-resources.png)
5.  Copy the path in the 'Source' box and paste it in the 'Destination'
    box. Click on the 'Relocatable' checkbox, to allow users to install
    the localizations folders in iTerm not located in the
    `/Applications` folder.
    ![Clicking "Relocatable"](/images/localization/relocatable.png)
    Repeat steps 4 and 5 for the localization folder located in
    `/Applications/iTerm.app/Contents/Frameworks/iTerm.framework/Versions/A/Resources/`
    ![Package Setup Assistant - Two Packages](/images/localization/repeat.png)
6.  Press the blue information button to edit title and description of the
    folders to be installed.  These information will appear in the
    installation window.
    ![Editing Package Information](/images/localization/edit-title.png)
7.  **Bundle Identifiers: Editing is not necessary**.  Press the 'Continue'
    button to proceed to the next step.
    ![Editing Bundle Identifiers](/images/localization/edit-bundle-identifiers.png)
8.  It is not necessary to provide information and resources in the next two
    setup windows, Package Metadata and Resources, but they can be helpful to
    the user.  Press the 'Continue' button in the Resources window to save the
    package.  Enter a name for the package and press the 'Save' button.
9.  During the package creation process, PackageMaker will ask for the
    administrator password twice.  Press the 'OK' button and type in the
    administrator password.
    ![Authorizing](/images/localization/authorize.png)
10. When successful, you should see the window below.
    ![Process Complete](/images/localization/finished.png)
