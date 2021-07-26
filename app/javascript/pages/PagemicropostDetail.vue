<template>
    <div v-if="micropost">
        <v-list-item>
            <v-list-item-avatar>
                <v-img src="https://picsum.photos/80/80/?random"></v-img>
            </v-list-item-avatar>

            <v-list-item-content>
                <span style="white-space: pre-line">
                    {{micropost.content}}
                </span>
            </v-list-item-content>
            <v-list-item-action>
                <v-btn icon @click="openEditMicropost">
                    <v-icon color="green lighten-1">mdi-pen</v-icon>
                </v-btn>
                <v-btn icon @click="deleteMicropost">
                    <v-icon color="error lighten-1">mdi-delete</v-icon>
                </v-btn>
            </v-list-item-action>
        </v-list-item>
        <v-divider
                :inset="true"
        ></v-divider>
        <micropost-edit-modal ref="dialog" :micropost="micropost" @update="updateMicropost"></micropost-edit-modal>
    </div>
</template>

<script>
    import axios from 'axios'
    import MicropostEditModal from '@/components/MicropostEditModal'
    export default {
        data() {
            return {
                micropost: null,
            }
        },
        components: {
            MicropostEditModal
        },
        created() {
            this.fetchMicropost()
        },
        computed: {
            micropostId() {
                return this.$route.params.id
            }
        },
        methods: {
            async fetchMicropost() {
                const res = await axios.get(`/api/microposts/${this.micropostId}`)
                this.micropost = res.data.micropost
            },
            openEditMicropost() {
                this.$refs.dialog.open()
            },
            async updateMicropost(micropostContent) {
                await axios.patch(`/api/microposts/${this.micropostId}`, { micropost: { content: micropostContent } })
                this.$refs.dialog.close()
                this.micropost.content = micropostContent
            },
            async deleteMicropost() {
              if (confirm("削除しますか?")) {
                await axios.delete(`/api/microposts/${this.micropostId}`)
                this.$router.push(`/microposts`)
              }
            }
        }
    }
</script>
