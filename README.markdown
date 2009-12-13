Credit where it's due
=====================
A lot of the inspiration, code and text for this plugin is borrowed (with much respect) from the QuickTicket plugin developed by Iterative Designs LLC. Check them out!

LightHouse Tickets
===================

LightHouse Tickets is a Rails plugin that utilizes the Lighthouse API to provide ticket creation within a Rails application. 
This will create a little icon on the bottom right of the application screen (which scrolls) that will display a pane when clicked. 
This will allow the user to provide their comments/issues/bug into  the pane which is then submitted to your Lighthouse account for the project.

What gets installed
===================

Once you have the plugin installed, you will find the following three new assets created into your application

* ./public/stylesheets/lighthouse_tickets.css   - This holds the default (and configurable) styling for the application, update it as you see fit or configure it not to be loaded.
* ./public/javascripts/lighthouse_tickets.js    - This holds the necessary javascript, written to work with the Prototype library.
* ./app/views/lighthouse_tickets/_form.html.erb - A view directory is created, which holds the form used to submit tickets to Lighthouse. This is created and placed here so it can be edited to your discretion.

Modify your configuration
=========================

New parameters have been added to your environment.rb file which will allow you to configure LightHouse Tickets. 
You need to modify these now.

Add this to your Routes
=======================

Add this route. This route will allow the app to call the creation method in the lighthouse ticket controller:

map.create_lighthouse_ticket "create_lighthouse_ticket", :controller=>"lighthouse_tickets", :action=>"create"

Add this to your View
=====================

Then you must add the following code to your layout or any view you want to add your ticket form:

<%= add_lighthouse_ticket_form %>

...AND YOUR DONE!

Requirements
============

This plugin requires the Lighthouse-API plugin found here: http://github.com/Caged/lighthouse-api/
or possibly here: http://lighthouseapp.com/api


Copyright (c) 2009 RubyMiner LLC, released under the MIT license
================================================================