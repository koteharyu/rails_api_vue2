<template>
  <div>
    <div class="mb-5">
      <micropost-form @created="createMicropost"></micropost-form>
    </div>
    <timeline-list :microposts="microposts"></timeline-list>
  </div>
</template>

<script>
import MicropostForm from '@/components/MicropostForm'
import TimelineList from '@/components/TimelineList'
import axios from "axios";
export default {
    data() {
        return {
            microposts: [],
        }
    },
    components: {
        MicropostForm,
        TimelineList
    },
    created() {
        this.fetchMicroposts()
    },
    methods: {
        async fetchMicroposts() {
            const res = await axios.get(`/api/microposts`)
            this.microposts = res.data.microposts
        },
        async createMicropost(micropostContent) {
            const micropostParams = {
                micropost: {
                    content: micropostContent
                }
            }
            const res = await axios.post(`/api/microposts`, micropostParams)
            this.microposts =[...[res.data.micropost], ...this.microposts]
        }
    }
}
</script>
