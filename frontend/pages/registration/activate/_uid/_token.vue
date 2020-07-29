<template>
  <v-container>
    <v-card v-if="status === 'pending'" class="pa-8 text-center">
      <p class="title">Please wait</p>
      <p class="body-1">Checking registration status...</p>
    </v-card>
    <v-card v-if="status === 'success'" class="pa-8 text-center">
      <p class="title primary--text">Activation successful</p>
      <p class="body-1">You may now log in.</p>
      <v-btn color="primary" text @click="navigateToLogin">Log In</v-btn>
    </v-card>
    <v-card v-if="status === 'error'" class="pa-8 text-center">
      <p class="title error--text">Invalid activation token</p>
      <p class="body-1">This token is invalid. Please try again.</p>
    </v-card>
  </v-container>
</template>

<script>
export default {
  auth: false,
  data: () => ({
    status: 'pending'
  }),
  mounted() {
    this.$axios
      .post('/api/v2/auth/users/activation/', this.$route.params)
      .then((response) => {
        this.status = 'success'
      })
      .catch(() => {
        this.status = 'error'
      })
  },
  methods: {
    navigateToLogin() {
      this.$router.push('/login')
    }
  }
}
</script>
