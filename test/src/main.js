/*import Vue from 'vue'

new Vue({
    el: 'body',
    data: {
        message: "Hello Vue"
    }
})*/

import Vue from 'vue'
import App from './app.vue'
import FormGenerator from './vue-form-generator.vue'

new Vue({
    el: 'body',
    components: {
        'app': App,
        'form-generator': FormGenerator
    }
});