<template>
  <div class="container mt-3">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <b-button type="is-success member-add-button" outlined>
      <router-link to="/members/new">
        メンバー新規作成
      </router-link>
    </b-button>
    <b-button type="is-success member-add-button" outlined>
      <router-link to="/members/question">
        メンバークイズ
      </router-link>
    </b-button>
    <b-table
      :data="isEmpty ? [] : members"
      :bordered="isBordered"
      :striped="isStriped"
      :narrowed="isNarrowed"
      :hoverable="isHoverable"
      :loading="isLoading"
      :focusable="isFocusable"
      :mobile-cards="hasMobileCards">

      <template slot-scope="props">
        <b-table-column field="id" label="ID">
          <router-link :to="{ name: 'MemberDetailPage', params: { id: props.row.id } }" class="member-id">{{ props.row.id }}</router-link>
        </b-table-column>
        
        <b-table-column field="name" label="名前" centered>
          {{ props.row.name }}
        </b-table-column>

        <b-table-column field="department" label="学部" centered>
          {{ props.row.department }}
        </b-table-column>

        <b-table-column field="grade" label="学年" centered>
          {{ props.row.grade }}
        </b-table-column>

        <b-table-column label="性別" centered>
          <b-icon pack="fas"
              :icon="props.row.gender === 'male' ? 'mars' : 'venus'">
          </b-icon>
          {{ props.row.gender }}
        </b-table-column>

        <b-table-column label="誕生日" centered>
          <span class="tag is-success">
            {{ props.row.birth }}
          </span>
        </b-table-column>

        <b-table-column field="action" label="" centered>
          <router-link :to="{ name: 'MemberEditPage', params: { id: props.row.id } }" class="member-id button is-warning is-small">
            編集
          </router-link>
          <b-button @click="deleteTarget = props.row.id; showModal = true" class="button is-danger is-small">削除</b-button>
        </b-table-column>
      </template>
    </b-table>

    <modal v-if="showModal" @cancel="showModal = false" @ok="deleteMember(); showModal = false;">
      <div slot="body">Are you sure?</div>
    </modal>
  </div>
</template>

<script>
import axios from 'axios';
import Modal from 'Modal.vue'

export default {
  components: {
    Modal
  },
  data: function () {
    return {
      members: [],
      showModal: false,
      deleteTarget: -1,
      errors: '',
      isEmpty: false,
      isBordered: false,
      isStriped: false,
      isNarrowed: false,
      isHoverable: true,
      isFocusable: false,
      isLoading: false,
      hasMobileCards: true
    }
  },
  mounted () {
    this.updateMembers();
  },
  methods: {
    deleteMember: function() {
      if (this.deleteTarget <= 0) {
        console.warn('deleteTarget should be grater than zero.');
        return;
      }

      axios
        .delete(`/api/v1/members/${this.deleteTarget}`)
        .then(response => {
          this.deleteTarget = -1;
          this.updateMembers();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
    updateMembers: function() {
      axios
        .get('/api/v1/members.json')
        .then(response => (this.members = response.data))
    }
  }
}
</script>

<style scoped lang="scss">
p {
  font-size: 2em;
  text-align: center;
}

a {
  color: #23d160;
}

.member-add-button {
  a:hover {
    color: white;
  }
}

.member-id {
  font-size: 20px;
}

.mt-3 {
  margin-top: 30px;
}

.member-update {
  a {
    color: rgba(0,0,0,.7);
  }

}
</style>