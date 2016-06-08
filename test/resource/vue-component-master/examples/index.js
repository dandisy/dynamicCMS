var Vue = require('vue');
Vue.config.debug = true;
Vue.config.async = false;
Vue.config.devtools = true;

new Vue({
    el: 'body',
    components: {
        examples: require('./examples.vue')
    }
});
