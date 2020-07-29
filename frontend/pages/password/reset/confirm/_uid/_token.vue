<template>
  <v-container class="fill-height fluid">
    <v-alert v-if="success" class="display-1 font-weight-thin">{{
      success
    }}</v-alert>
    <v-row v-else align="center" justify="center">
      <v-col cols="12" sm="8" md="4">
        <v-alert v-if="expiredToken" class="body-1 align-center error--text"
          >This password reset token has expired. Please attempt to change your
          password again.</v-alert
        >
        <div class="display-1 font-weight-thin">Change Password</div>
        <v-form>
          <div v-if="errorMsg" class="error--text">{{ errorMsg }}</div>
          <v-text-field
            v-model="form.new_password"
            label="New password"
            :error-messages="errors.new_password"
            name="new_password"
            prepend-icon="mdi-account"
            type="password"
          />
          <v-text-field
            v-model="form.re_new_password"
            label="Confirm password"
            :error-messages="errors.re_new_password"
            name="re_new_password"
            prepend-icon="mdi-lock"
            type="password"
          />
        </v-form>
        <v-row align="center" justify="space-between">
          <v-col cols="12">
            <v-btn
              class="primary--text outlined"
              width="100%"
              @click.stop="reset"
              >Save</v-btn
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
      new_password: null,
      re_new_password: null,
      token: null,
      uid: null
    },
    success: null
  }),
  computed: {
    errorMsg() {
      const errors = this.errors.non_field_errors
      return errors && errors.length ? errors[0] : null
    },
    expiredToken() {
      return this.errors.token && this.errors.token.length > 0
    }
  },
  mounted() {
    const { uid, token } = this.$route.params
    this.form.uid = uid
    this.form.token = token
  },
  methods: {
    reset() {
      this.errors = {}
      if (this.form.new_password !== this.form.re_new_password) {
        this.errors = { new_password: 'Passwords must match.' }
        return
      }
      const url = '/api/v2/auth/users/reset_password_confirm/'
      this.$axios
        .post(url, this.form)
        .then((response) => {
          this.success = response.msg
        })
        .catch((error) => {
          this.errors = error.response.data
        })
    }
  }
}
</script>
