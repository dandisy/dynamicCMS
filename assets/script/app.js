/**
 * Created by rbz on 5/16/2016.
 */


Vue.config.delimiters = ['@{', '}'];

// define
var WcWelcome = Vue.extend({
    template: '<div class="welcome"><h1>Webcore</h1></div>'
});

var WcRibonMenu = Vue.extend({
    template: '<h3>Dashboard</h3><div class="ribon-menu-item"><span>Save</span></div>'
});

// register
Vue.component('wc-welcome', WcWelcome);
Vue.component('wc-ribon-menu', WcRibonMenu);

new Vue({
    el: '#content'
});

new Vue({
    el: '#ribon-menu'
});


//////////////////////////////////

// demo data
var data = {
    name: 'My Tree',
    children: [
        { name: 'hello' },
        { name: 'wat' },
        {
            name: 'child folder',
            children: [
                {
                    name: 'child folder',
                    children: [
                        { name: 'hello' },
                        { name: 'wat' }
                    ]
                },
                { name: 'hello' },
                { name: 'wat' },
                {
                    name: 'child folder',
                    children: [
                        { name: 'hello' },
                        { name: 'wat' }
                    ]
                }
            ]
        }
    ]
};

// define the item component
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
            return this.model.children &&
                this.model.children.length
        }
    },
    methods: {
        toggle: function () {
            if (this.isFolder) {
                this.open = !this.open
            }
        },
        changeType: function () {
            if (!this.isFolder) {
                Vue.set(this.model, 'children', [])
                this.addChild();
                this.open = true
            }
        },
        addChild: function () {
            this.model.children.push({
                name: 'new stuff'
            })
        }
    }
});

// boot up the demo
var demo = new Vue({
    el: '#demo',
    data: {
        treeData: data
    }
});
