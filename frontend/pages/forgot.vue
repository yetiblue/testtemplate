<template>
  <v-container class="fill-height fluid">
    <v-alert v-if="success" class="display-1 font-weight-thin">{{
      success
    }}</v-alert>
    <v-row v-else align="center" justify="center">
      <v-col cols="12" sm="8" md="4">
        <v-form>
          <div v-if="errorMsg" class="error--text">{{ errorMsg }}</div>
          <v-text-field
            v-model="form.email"
            label="Email Address"
            :error-messages="errors.email"
            name="email"
            prepend-icon="mdi-account"
            type="text"
          />
        </v-form>
        <v-row align="center" justify="space-between">
          <v-col cols="12">
            <v-btn
              class="primary--text outlined"
              width="100%"
              @click.stop="reset"
              >Reset Password</v-btn
            >
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  auth: false,
  data: () => ({
    errors: {},
    form: {
      email: null
    },
    success: null
  }),
  computed: {
    errorMsg() {
      const errors = this.errors.non_field_errors
      return errors && errors.length ? errors[0] : null
    }
  },
  methods: {
    reset() {
      this.errors = {}
      this.$axios
        .post('/api/v2/auth/users/reset_password/', this.form)
        .then((response) => {
          this.success =
            'Password reset sent. Please check your email and follow the provided link.'
        })
        .catch((error) => {
          this.errors = error.response.data
        })
    }
  }
}
</script>
