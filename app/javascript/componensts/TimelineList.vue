<template>
  <v-card>
    <v-list three-line>
      <micropost-item
        v-for="micropost in microposts" :key="micropost.id" :micropost="micropost"
      ></micropost-item>
    </v-list>
  </v-card>
</template>

<script>
import MicropostItem from './MicropostItem.vue';

export default {
  components: {
    MicropostItem,
  },
  props: {
    microposts: {
      type: Array,
      default: [],
    },
  },
}
</script>
