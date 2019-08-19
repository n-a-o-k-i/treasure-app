<template>
  <div class="container">
    <!-- MITライセンスバンザイ！ -->
    <div class="row">
      <div class="offset-2 col-8" v-if="!completed">
        <div class="mt-3">
          <span class="badge badge-primary">第 {{ (questionIndex+1) }} 問</span>
          <h4 class="card-title">{{ currentQuestion.question }}</h4>
          <hr>
          <div
          class="btn btn-success btn-lg btn-block text-left"
          v-for="(answer,index) in currentQuestion.answers"
          @click="addAnswer(index)">{{ (index+1) }}. {{ answer }}</div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="offset-3 col-6" v-if="completed">
        <div class="card">
          <div class="card-body">
            <p class="badge badge-dark">結果</p>
            <div v-for="(question,index) in this.questions">
              <h4 class="card-title">{{ question.question }}</h4>
              <ul>
                <li v-for="answer in question.answers">{{ answer }}</li>
              </ul>
              <div v-if="question.answer == answers[index]">正解 &#x1F44D;（{{ question.answers[question.answer] }}）</div>
              <div v-else>
                不正解 &#x1F622;<br>正解は「{{ question.answers[question.answer] }}」でした。
                <router-link :to="{ name: 'MemberDetailPage', params: { id: question.member_id } }" class="member-id">{{ question.member_name }}についてもっと勉強する</router-link>
              </div>
              <hr>
            </div>
          </div>
        </div>
      </div>
    </div>
    
  </div>
</template>

<script>
  export default {
    data() {
      return {
        answers: [],
        member_id: '',
        member_name: '',
        questionIndex: 0,
        questions: [
        {
          question: 'てらがこの前までインターンしていた会社は？',
          answers: [
          'entershare',
          'evolute',
          'enterplus',
          ],
          answer: 0,
          member_id: 1,
          member_name: "てら"
        },
        {
          question: 'とむの出身地は？',
          answers: [
          '名古屋',
          '金沢',
          '長野',
          ],
          answer: 0,
          member_id: 2,
          member_name: "とむ"
        },
        {
          question: 'りゅうが最近髪を切った日は？',
          answers: [
          '8/15',
          '8/16',
          '8/17',
          ],
          answer: 1,
          member_id: 3,
          member_name: "りゅう"
        },
        {
          question: 'てるふのが１７歳のときに選ばれたのは何jr？',
          answers: [
          'ITエンジニア',
          '未踏',
          '国家技術者',
          ],
          answer: 1,
          member_id: 4,
          member_name: "てるふの"
        },
        {
          question: 'ダンテの大学は？',
          answers: [
          '東京大学',
          '大阪大学',
          '京都大学',
          ],
          answer: 2,
          member_id: 5,
          member_name: "ダンテ"
        }
        ]
      }
    },
    mounted () {
    },
    methods: {
      addAnswer: function(index) {
        this.answers.push(index);
        if(!this.completed) {
          this.questionIndex++;
        }
      }
    },
    computed: {
      currentQuestion: function() {
        return this.questions[this.questionIndex];
      },
      completed: function() {
        return (this.questions.length == this.answers.length);
      }
    }
  }
</script>