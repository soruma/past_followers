<template>
  <v-container>
    <v-row>
      <v-col v-for="user in users" :key="user.id" :cols="6">
        <n-link :to="`/past_followers/${user.id}`">
          <v-card>
            <v-list-item>
              <v-list-item-avatar size="70px" class="user-avatar">
                <v-img :src="user.profileImageUrl"></v-img>
              </v-list-item-avatar>

              <v-list-item-content>
                <v-list-item-title v-text="user.name"></v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-card>
        </n-link>
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import gql from 'graphql-tag'
import { User } from '~/lib/GraphQL/generated'
import 'vue-apollo'

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
          profileImageUrl
        }
      }
    `
  }
})
</script>

<style>
.user-avatar {
  margin-right: 10px;
}
</style>
