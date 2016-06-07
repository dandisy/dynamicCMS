/**
 * Created by rbz on 5/16/2016.
 */

Vue.config.delimiters = ['@{', '}'];


/* -----------------------------------------------------------------
 DATA
 ---------------------------------------------------------------- */

// item data
var data = {
    name: 'Content',
    children: [
        { name: 'Other Web' },
        {
            name: 'Redbuzz',
            children: [
                {
                    name: 'Home',
                    children: [
                        { name: 'Articles' },
                        { name: 'Landing Page' }
                    ]
                },
                { name: 'About' },
                { name: 'Service' },
                {
                    name: 'On Promise',
                    children: [
                        { name: 'Webcore' },
                        { name: 'Geray' }
                    ]
                }
            ]
        }
    ]
};


/* -----------------------------------------------------------------
 DEFINE COMPONENT
 ---------------------------------------------------------------- */

// welcome
var WcWelcome = Vue.extend({
    template: '<div class="welcome"><h1>Webcore</h1></div>'
});

Vue.component('wc-welcome', WcWelcome);

// ribon
var WcRibonMenu = Vue.extend({
    template: '' +
    '<h3>Dashboard</h3>' +
    '<div class="ribon-menu-item">' +
        '<span>Save</span>' +
    '</div>'
});

Vue.component('wc-ribon-menu', WcRibonMenu);

// field
Vue.component('wc-field', {
    props: ['title', 'type', 'placeholder', 'value'],
    template: '<input type="@{type}" value="@{value}">'
});

// item
Vue.component('item', {
    template: '#item-template',
    props: {
        model: Object
    },
    data: function () {
        return {
            open: false
        }
    },
    computed: {
        isFolder: function () {
            return this.model.children && this.model.children.length
        }
    },
    methods: {
        toggle: function () {
            if (this.isFolder) {
                this.open = !this.open;
            }
        },
        changeType: function () {
            if (!this.isFolder) {
                Vue.set(this.model, 'children', []);
                this.addChild();
                this.open = true;
            }
        },
        addChild: function () {
            this.model.children.push({
                name: 'New Item'
            });
        }
    }
});


/* -----------------------------------------------------------------
    BOOT UP
 ---------------------------------------------------------------- */

// content
var content = new Vue({
    el: '#content',
    data: {
        treeData: data
    }
});

// ribon
var ribon = new Vue({
    el: '#ribon-menu'
});

var vm = new Vue({
    el: "#app",
    components: {
        "vue-form-generator": VueFormGenerator.component
    },

    filters: {
        prettyJSON: function(json) {
            if (json) {
                json = JSON.stringify(json, undefined, 4);
                json = json.replace(/&/g, '&').replace(/</g, '<').replace(/>/g, '>');
                return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function(match) {
                    var cls = 'number';
                    if (/^"/.test(match)) {
                        if (/:$/.test(match)) {
                            cls = 'key';
                        } else {
                            cls = 'string';
                        }
                    } else if (/true|false/.test(match)) {
                        cls = 'boolean';
                    } else if (/null/.test(match)) {
                        cls = 'null';
                    }
                    return '<span class="' + cls + '">' + match + '</span>';
                });
            }
        }
    },

    data: {
        model: {
            id: 1,
            name: "John Doe",
            password: "J0hnD03!x4",
            skills: ["Javascript", "VueJS"],
            email: "john.doe@gmail.com",
            status: true
        },
        schema: {
            fields: [{
                type: "text",
                label: "ID",
                model: "id",
                readonly: true,
                featured: false,
                disabled: true
            }, {
                type: "text",
                label: "Name",
                model: "name",
                readonly: false,
                featured: true,
                required: true,
                disabled: false,
                placeholder: "User's name",
                validator: VueFormGenerator.validators.string
            }, {
                type: "password",
                label: "Password",
                model: "password",
                min: 6,
                required: true,
                hint: "Minimum 6 characters",
                validator: VueFormGenerator.validators.string
            }, {
                type: "email",
                label: "E-mail",
                model: "email",
                placeholder: "User's e-mail address",
                validator: VueFormGenerator.validators.email
            }, {
                type: "checklist",
                label: "Skills",
                model: "skills",
                multi: true,
                required: true,
                multiSelect: true,
                values: ["HTML5", "Javascript", "CSS3", "CoffeeScript", "AngularJS", "ReactJS", "VueJS"]
            }, {
                type: "checkbox",
                label: "Status",
                model: "status",
                multi: true,
                readonly: false,
                featured: false,
                disabled: false,
                default: true
            }]
        },

        formOptions: {
            validateAfterLoad: true,
            validateAfterChanged: true
        }
    }
});
