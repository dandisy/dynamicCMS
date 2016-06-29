### System Structure

####    Webcore - DynamicCMS

    Contents :
        Schema Item
        Content Item
        Object Item
        Asset

    Arangement :
        Main Menu (Dashboard, Schema, Content, Object, Asset, Setting)
        Ribon Menu (Save, etc)
        Item Tree View
        Data Field


1.  Schema Item

        Objective
            To manage Schema Item tree and Data Field definition

        Arangement
            Schema Item tree view on left side
            Data Field definition on right side with default fields :
                Data Fileds tabs :
                    id
                    as navigation
                Presentation tabs
                    route (controller/action)
                    view

    1.  Schema Item tree

            *   Objective
                    Create :
                        New Item
                        New Folder
                    Rename
                    Delete
                    Edit :
                        Copy
                        Cut
                        Paste
                    Custome
                        Change Icon

            *   Behavior
                    Right Click for context menu
                    Double click for open or close folder

    2.  Data Field definition

            *   Objective
                    To define data field :
                    Title
                    Description
                    Type :
                        Basic
                            Text (Single Text)
                            Textarea (Multi Text)
                            Radio (Single Choise)
                            Checkbox (Multi Choise)
                            Option (Dropdown Option)
                            Multi Option (Dropdown Multi Option)
                            File (Single File Upload)
                        Advance
                            Text Editor (Multi Text & HTML)
                            Date Picker
                            Time Picker
                            Datetime Picker
                            Color Picker
                            Tags Input
                            Including Option (Left Include vs Right Exclude)
                            Media Gallery (Multi File Upload)
                            Data Source (Data from other Item)
                            Data Grid (Dynamic Tabel based on Data Source)
                            Geo Location Picker
                    Placeholder
                    Value (Default)

            *   Behavior & Procedure
                    1.  Filling form
                    2.  Click submit button to submit data field definition shown
                        above form data field definition
                    3.  Click save button to save on database


2.  Content Item

        Objective
            To manage Content Item tree and filling Data Field
            To config Presentation (route/controller and view)

        Arangement
            Content Item tree view on left side
            Data Field with additional tabs for Presentation on right side

    1.  Content Item tree

            *   Objective
                    __Same above__

            *   Behavior
                    __Same above__

    2.  Data Field (with versioning)

            *   Objective
                    To filling data field
                    To config Presentation (route/controller and view)

            *   Behavior & Procedure
                    1.  Filling form
                    2.  Click save button to save on database


3.  Object Item

        Objective
            To manage Object Item tree and UI Component

        Arangement
            Object Item tree view on left side
            UI Component on right side

    1.  Object Item tree

            *   Objective
                    Create :
                        New Object (from Item Class)
                        New Class
                        New Folder
                    __Same above__

            *   Behavior
                    __Same above__

    2.  UI Component (with versioning)

            *   Objective
                    For Item Class to define UI Component definition
                        UI Component contents :
                            Window (full width)
                            Panel (user sepecific width)
                            Tabs
                            Accordion
                            __All filed type - same above__

                        Note :
                            If want list of object based on their class shown in
                            data grid, we can create tabs on window, content data grid
                            with data source refer to this class instant.
                            And we can move this tabs before UI Component definition tabs
                            for confinient navigation

                    For Item Object to filling UI Componrnt

            *   Behavior & Procedure
                    Class Item
                        Define UI Component
                        Click save button to save on database
                    Object Item
                        Filling UI Component
                        Click save button to save on database


4.  Asset

        Objective
            To manage Asset Item tree and Asset Data

        Arangement
            Asset Item tree view on left side
            Asset Data on right side

    1.  Asset Item tree

            *   Objective
                    __Same above__

            *   Behavior
                    __Same above__

    2.  Asset Data

            *   Objective
                    To manage Asset Data like windows explorer

            *   Behavior & Procedure
                    1.  Click Upload button to upload Asset Data
                    2.  Click Create New Folder button to create Folder
                    3.  Click Delete buttom after select multi Asset to delete
                        multiple asset
                    4.  Select Order option to order Asset Data
                    5.  Select Filter option to filter Asset Data
                    6.  Click Toggle View button to toggle view (grid or list)
                    7.  Fill keyword and click Search button to search Asset Data
                    8.  Click Asset Data to zooming preview Asset Data on full screen slider
                    9.  Right click on Asset Data to :
                        Rename
                        Delete
                        Edit :
                            Copy
                            Cut
                            Paste
                    10.  Right click on blank area in Asset Data container
                        to :
                            Create New Folder
                            Toggle View :
                                grid
                                list

by dandi@redbuzz.co.id