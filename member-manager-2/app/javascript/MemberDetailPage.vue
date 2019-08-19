<template>
	<div class="container is-fluid mt-3">
    <div class="columns">
      <div class="member-infomations column is-3">
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
            <b-input v-model="member.joined_date"></b-input>
          </div>
        </div>
        <hr>
        <div class="columns member-info-inputs">
          <div class="column is-4 member-info-lavel">
            誕生日
          </div>
          <div class="column is-6">
            <b-input v-model="member.birth"></b-input>
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
      </div>

      <div class="column is-4 is-offset-1">
        <line-chart :chart-data="datacollection"></line-chart>
      </div>

      <div class="column is-3 is-offset-1">
        
      </div>
    </div>
    
    <b-button type="is-limegreen member-add-button" class="mt-3" outlined>
      <router-link to="/">
        メンバー一覧へ
      </router-link>
    </b-button>
  </div>
</template>

<script>
  import axios from 'axios';
  import LineChart from './LineChart.js'

  export default {
    components: {
      LineChart
    },
    data: function () {
      return {
        member: [],
        datacollection: null
      }
    },
    mounted () {
      this.fillData(),
      axios
      .get(`/api/v1/members/${this.$route.params.id}.json`)//''で囲うとデータを取れない
      .then(response => (this.member = response.data))
    },
    methods: {
      fillData () {
        this.datacollection = {
          labels: ["月","火","水","木","金","土","日"],
          datasets: [
          {
            label: 'Contribution',
            backgroundColor: '#23d160',
            data: [3,0,3,6,1,1,5]
          }
          ]
        }
      },
      getRandomInt () {
        return Math.floor(Math.random() * (50 - 5 + 1)) + 5
      }
    }
  }

  $(function(){
    $(".column").on('click', function(){
      console.log("test");
      $.ajax({
        url:'/get_github_data' + '.json',
        type:'GET',
        dataType: 'json',
        success: function(response){
          console.log(response);
        }
      })
    })
  });
</script>

<style scoped lang="scss">
.column {
  padding: 10px 0px 0px 20px;
}

.member-infomations {
  background-color: #00d1b2;
  border-radius: 4px;
  color: white;
  height: 500px;
  margin-top: 20px;
}

.member-info-lavel {
  text-align: center;
  padding-top: 15px;
}

hr {
  margin: 10px;
  height: 1px;
}

p {
  font-size: 2em;
  text-align: center;
}

a {
  color: #00d1b2;
}

.member-info-inputs {
  margin-bottom: 0px !important;
}

.mt-3 {
  margin-top: 30px;
}

.pb-2 {
  padding-bottom: 10px;
}

.member-add-button:hover {
  background-color: #00d1b2;
  border-color: white;
  a {
    color: white;
  }
}

.is-limegreen {
  border-color: #00d1b2;
}

iframe {
  height: 100%;
}
</style>