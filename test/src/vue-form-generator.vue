<template>
    <div class="panel-body">
        <vue-form-generator :schema="schema" :model="model" :options="formOptions"></vue-form-generator>
    </div>
</template>

<script>
    import Vue from 'vue'
    import VueFormGenerator from "vue-form-generator";

    Vue.use(VueFormGenerator);

    export default{
        data(){
            return{
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
                        label: "Title",
                        model: "title",
                        min: 3,
                        required: true,
                        placeholder: "Title of this Item",
                        validator: VueFormGenerator.validators.string
                    }, {
                        type: "text",
                        label: "Description",
                        model: "description",
                        min: 40,
                        required: true,
                        placeholder: "Description of this Item",
                        validator: VueFormGenerator.validators.string
                    }, {
                        type: "checklist",
                        label: "Category",
                        model: "category",
                        multi: true,
                        required: true,
                        multiSelect: true,
                        values: ["Artikel", "Foto", "Video", "Press"]
                    }, {
                        type: "checkbox",
                        label: "As Navigation",
                        model: "as_navigation",
                        multi: true,
                        readonly: false,
                        featured: false,
                        disabled: false,
                        default: true
                    }]
                },
                model: {
                    id: 1,
                    title: "Jelajah Indonesia",
                    description: "Eksplorasi Budaya di Zamrud Khatulistiwa",
                    category: ["Artikel"],
                    as_navigation: true
                },
                formOptions: {
                    validateAfterLoad: true,
                    validateAfterChanged: true
                }
            }
        }
    }
</script>
