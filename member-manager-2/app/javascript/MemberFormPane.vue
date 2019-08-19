<template>
  <form @submit.prevent="$emit('submit')">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div class="member-infomations column is-8 is-offset-2">
      <div class="columns member-info-inputs">
        <div class="column is-4 member-info-lavel">
          名前
        </div>
        <div class="column is-6">
          <b-input v-model="member.name"></b-input>
        </div>
      </div>
      <hr>
      <div class="columns member-info-inputs">
        <div class="column is-4 member-info-lavel">
          年齢
        </div>
        <div class="column is-6">
          <b-input v-model="member.age"></b-input>
        </div>
      </div>
      <hr>
      <div class="columns member-info-inputs">
        <div class="column is-4 member-info-lavel">
          学部
        </div>
        <div class="column is-6">
          <b-input v-model="member.department"></b-input>
        </div>
      </div>
      <hr>
      <div class="columns member-info-inputs">
        <div class="column is-4 member-info-lavel">
          学年
        </div>
        <div class="column is-6">
          <b-input v-model="member.grade"></b-input>
        </div>
      </div>
      <hr>
      <div class="columns member-info-inputs">
        <div class="column is-4 member-info-lavel">
          性別
        </div>
        <div class="column is-6">
          <b-input v-model="member.gender"></b-input>
        </div>
      </div>
      <hr>
      <div class="columns member-info-inputs">
        <div class="column is-4 member-info-lavel">
          入会日
        </div>
        <div class="column is-6">
          <b-input type="date" v-model="member.joined_date"></b-input>
        </div>
      </div>
      <hr>
      <div class="columns member-info-inputs">
        <div class="column is-4 member-info-lavel">
          誕生日
        </div>
        <div class="column is-6">
          <b-input type="date" v-model="member.birth"></b-input>
        </div>
      </div>
      <hr>
      <div class="columns member-info-inputs">
        <div class="column is-4 member-info-lavel">
          電話番号
        </div>
        <div class="column is-6">
          <b-input v-model="member.tel"></b-input>
        </div>
      </div>
      <hr>
      <div class="columns member-info-inputs">
        <div class="column is-4 member-info-lavel">
          住所
        </div>
        <div class="column is-6 pb-2">
          <b-input v-model="member.address"></b-input>
        </div>
      </div>
      <div class="submit-button-wrapper">
        <button type="submit" class="button is-info submit-button">送信</button>
      </div>
      <b-button type="is-limegreen member-add-button" class="mt-3" outlined>
          <router-link to="/">
            メンバー一覧へ
          </router-link>
        </b-button>
    </div>
  </form>
</template>

<script>
export default {
  props: {
    member: {},
    errors: ''
  }
}
</script>

<style scoped lang="scss">
  .columns {
    margin: 0;
    .column {
      padding: 12px 12px 5px 12px;
    }
  }

  hr {
    margin: 5px;
  }

  .submit-button-wrapper {
    margin-top: 20px;
    text-align: center;
    .submit-button {
      width: 30%;
    }
  }

  .is-limegreen {
    border-color: #00d1b2;
  }

  .member-add-button:hover {
    background-color: #00d1b2;
    border-color: white;
    a {
      color: white;
    }
  }

  a {
    color: #00d1b2;
  }
</style>