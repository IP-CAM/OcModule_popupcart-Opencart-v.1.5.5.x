Description
==================

Module for ocStore (opencart) - Pop-up cart. The add-on shows a pop-up window with the contents of the cart when purchasing a product.
To increase sales, added a subsection "Buy with this product", the content of which is formed on the basis of the "Related products" fields of those products that have been added to the cart.

Installation
====================

The installation procedure is as follows:

1. Download the module.
2. Upload files to the store folder.
3. Install the module in the control panel.
4. Add "modules" to the pages where the basket should appear, it is recommended to specify the position "Bottom of the page".
5. Set the required settings

Note:

To be triggered by clicking the "add to cart" button, the module attaches a handler to it. Buttons are detected according to special rules. Therefore, if after installation the module does not respond to pressing, then most likely
1. The module was not displayed on the required page, for this it is enough to check the presence of the popupcart.js script in the page resources.
2. The standard layout has been changed. In this case, it is necessary to enter the acc. changes to the rules for finding buttons in the popupcart.js file


Features:
==================

1. The module does not change any store files.
2. The file with the design (popupcart.css) can be redefined as the cart display template
(popupcart / index.tpl, popupcart / load.tpl), it is enough to place the files in acc. folder with the current theme.
3.js code is separated into a separate module, methods for managing this module are defined, therefore, if necessary
you can easily change the standard functionality.
4. You can close the window in several different ways: ESC key, click on the area around the window, click on the cross in the window title.

OcStore / opencart compatibility
=================
ocStore 1.5.1 - 1.5.5 - yes
opencart 1.5. * - yes

Tested on browsers
=================
Chrome
Firefox
Opera
Safari

Note:
The latest versions of browsers were taken for testing. 
