<template>
  <member-form-pane :errors="errors" :member="member" @submit="updateMember"></member-form-pane>
</template>

<script>
import axios from 'axios';

import MemberFormPane from 'MemberFormPane.vue';

export default {
  components: {
    MemberFormPane
  },
  data() {
    return {
      member: {},
      errors: ''
    }
  },
  mounted () {
    axios
      .get(`/api/v1/members/${this.$route.params.id}.json`)
      .then(response => (this.member = response.data))
  },
  methods: {
    updateMember: function() {
      axios
        .patch(`/api/v1/members/${this.member.id}`, this.member)
        .then(response => {
          this.$router.push({ name: 'MemberDetailPage', params: { id: this.member.id } });
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>

<style scoped>
</style>