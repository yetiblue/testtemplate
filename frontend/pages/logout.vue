<template>
  <v-container>
    <p>Logging out...</p>
  </v-container>
</template>

<script>
export default {
  mounted() {
    this.$auth.logout()
  }
}
</script>
