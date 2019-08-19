<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import MemberIndexPage from 'MemberIndexPage.vue'
import MemberDetailPage from 'MemberDetailPage.vue'
import MemberNewPage from 'MemberNewPage.vue'
import MemberEditPage from 'MemberEditPage.vue'
import MemberQuestionPage from 'MemberQuestionPage.vue'
import RandomChart from 'RandomChart.vue'

const router = new VueRouter({
  routes: [
    { path: '/',
      component: MemberIndexPage  },
    { path: '/members/:id(\\d+)',
      name: 'MemberDetailPage',
      component: MemberDetailPage  },
    { path: '/members/new',
      name: 'MemberNewPage',
      component: MemberNewPage    },
    { path: '/members/:id(\\d+)/edit',
      name: 'MemberEditPage',
      component: MemberEditPage   },
    { path: '/chart',
      name: 'RandomChart',
      component: RandomChart   },
    { path: '/members/question',
      name: 'MemberQuestionPage',
      component: MemberQuestionPage   }
  ]
})

// ref. https://jp.vuejs.org/v2/guide/plugins.html#%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%81%AE%E4%BD%BF%E7%94%A8
Vue.use(VueRouter)

export default {
  router
}
</script>

<style scoped>
</style>