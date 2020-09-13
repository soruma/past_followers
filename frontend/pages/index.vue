<template>
  <div>
    <h1>Users</h1>

    <user-list />
  </div>
</template>

<script lang="ts">
import UserList from '~/components/UserList.vue'

export default {
  components: {
    UserList
  }
}
</script>
