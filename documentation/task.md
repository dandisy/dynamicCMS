##   DynamicCMS

1. Content Management

    *   UI

            JSON (component data model) based web content

        Dashboard, Schema, Content, Object :

            on selection event
                change component on body element respectivally

        *   Schema

            Item Tree Section

                on page load event
                    get Item Tree data from database and converted to VueJS model to show in Item Tree Section

                on Item creation event
                    show option for create Item-Schema or Folder-Schema

                on Item created event
                    show Standard Field & button Add Field in Field Definition Section

            Field Definition Section

                on page load event
                    blank (or show Webcore logo)

                on Item selection event
                    show it's Field Definition in Field Definition Section

                on Field creation event
                    show option (type field, placeholder, default value)

                on Field created event
                    update VueJS model to show Item Tree data change
                    update VueJS model to show new Field Defined below Field stack

            Action

                on Save
                    send VueJS model (Field Definition JSON data) to PHP and convert to PHP Array to process create or alter Schema-Item table

        *   Content

            Item Tree Section

                on page load event
                    get Item Tree data from database and converted to VueJS model to show in Item Tree Section

                on Item creation event
                    show option for create Item-Content (based on Schema Item) or Folder-Content

                on Item created event
                    update VueJS model to show Item Tree data change
                    show Fields in Content Definition Section

            Content Definition Section

                on page load event
                    blank (or show Webcore logo)

                on Item selection event
                    show it's Content Data in Content Definition Section

            Action

                on Save
                    send VueJS model (JSON Data) to PHP and convert to PHP Array to process insert or update record in Schema-Item table

        *   Object
        *   Dashboard

    *   PHP
    *   Database

2.  Content Presentation

    *   UI

            standard template based website

    *   Webcore API modules

            API to access Content Items (return PHP array or JSON)

