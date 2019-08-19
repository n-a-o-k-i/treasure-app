<template>
  <member-form-pane :errors="errors" :member="member" @submit="createMember"></member-form-pane>
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
  methods: {
    createMember: function() {
      axios
        .post('/api/v1/members', this.member)
        .then(response => {
          let m = response.data;
          this.$router.push({ name: 'MemberDetailPage', params: { id: m.id } });
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