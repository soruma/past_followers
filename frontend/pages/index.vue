<template>
  <div :class="$style.container">
    <h1>Users</h1>
    <ul>
      <li v-for="user in users" :key="user.id">
        {{ user.name }}
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import gql from 'graphql-tag'
import { User } from '~/lib/GraphQL/generated'

interface Data {
  users?: User[]
}

export default Vue.extend({
  data(): Data {
    return {
      users: undefined
    }
  },
  computed: {
    allUsers(): User[] {
      if (this.users == null) return []
      return this.users
    }
  },
  apollo: {
    users: gql`
      query {
        users {
          id
          name
        }
      }
    `
  }
})
</script>

<style module>
.container {
  margin: 10px;
}
</style>
