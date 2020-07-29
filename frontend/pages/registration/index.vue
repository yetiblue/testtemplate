<template>
  <v-container class="fill-height fluid">
    <v-row align="center" justify="center">
      <v-col cols="12" sm="8" md="4">
        <v-form>
          <div v-if="errorMsg" class="error--text">{{ errorMsg }}</div>
          <v-text-field
            v-model="form.email"
            label="Email"
            :error-messages="errors.email"
            name="email"
            prepend-icon="mdi-email"
            type="text"
          />
          <v-text-field
            v-model="form.password"
            label="Password"
            :error-messages="errors.password"
            name="password"
            prepend-icon="mdi-lock"
            type="password"
          />
          <v-text-field
            v-model="form.re_password"
            label="Repeat Password"
            :error-messages="errors.re_password"
            name="re_password"
            prepend-icon="mdi-lock"
            type="password"
          />
        </v-form>
        <v-row align="center" justify="space-between">
          <v-col cols="4">
            <v-btn
              class="error--text outlined"
              width="100%"
              @click.stop="forgot"
              >Forgot</v-btn
            >
          </v-col>
          <v-col cols="8">
            <v-btn
              class="primary--text outlined"
              width="100%"
              @click.stop="register"
              >Register</v-btn
            >
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'RegistrationPage',
  auth: false,
  data: () => ({
    errors: {},
    form: {
      email: null,
      password: null,
      username: null
    }
  }),
  computed: {
    errorMsg() {
      const errors = this.errors.non_field_errors
      return errors && errors.length ? errors[0] : null
    }
  },
  mounted() {
    if (this.$auth.loggedIn) {
      this.$router.push('/dashboard')
    }
  },
  methods: {
    register() {
      this.errors = {}
      const formData = { ...this.form, username: this.form.email }
      this.$axios
        .post('/api/v2/auth/users/', formData)
        .then((response) => {
          this.$router.push('/registration/awaiting_confirmation/')
        })
        .catch((err) => {
          this.$auth.logout()
          this.errors = err.response.data
          this.errors.email = this.errors.username
        })
    }
  }
}
</script>
