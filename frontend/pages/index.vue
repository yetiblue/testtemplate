<template>
  <v-layout column justify-center align-center>
    <v-flex xs12 sm8 md6>
      <v-card>
        <v-card-title class="headline">
          Coming Soon
        </v-card-title>
        <v-card-text>
          <p>This project is under current development.</p>
          <p>Please check back later, or contact us for more info.</p>
        </v-card-text>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  auth: false,
  mounted() {
    if (this.$auth.loggedIn) {
      this.$router.push('/dashboard')
    }
  }
}
</script>
