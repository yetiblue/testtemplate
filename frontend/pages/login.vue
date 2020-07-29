<template>
  <v-container class="fill-height fluid">
    <v-row align="center" justify="center">
      <v-col cols="12" sm="8" md="4">
        <v-form>
          <div v-if="errorMsg" class="error--text">{{ errorMsg }}</div>
          <v-text-field
            v-model="form.username"
            label="Username"
            :error-messages="errors.username"
            name="username"
            prepend-icon="mdi-account"
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
              @click.stop="login"
              >Login</v-btn
            >
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data: () => ({
    errors: {},
    form: {
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
    async login() {
      this.errors = {}
      try {
        await this.$auth.loginWith('local', {
          data: this.form
        })
        this.$router.push('/dashboard')
      } catch (err) {
        this.errors = err.response.data
      }
    },
    forgot() {
      this.$router.push('/forgot')
    }
  }
}
</script>
