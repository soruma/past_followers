<template>
  <div>
    <h1>{{ this.user.name }}</h1>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import gql from 'graphql-tag'
import { User } from '~/lib/GraphQL/generated'

interface Data {
  user?: User
}

export default Vue.extend({
  data(): Data {
    return {
      user: { name: '', createdAt: null, id: '', pastFollowers: [], updatedAt: null }
    }
  },
  computed: {
    findUser(): User {
      if (this.user == null) return { name: '', createdAt: null, id: '', pastFollowers: [], updatedAt: null }
      return this.user
    }
  },
  apollo: {
    user: {
      query: gql`
        query findUser($id: ID!) {
          user(id: $id) {
            id
            name
            profileImageUrl
          }
        }
      `,
      variables() {
        return {
          id: this.$route.params.id
        }
      }
    }
  }
})
</script>
