<template>
  <v-card class="pa-4 mb-4">
    <h2 class="title font-weight-thin">Change Password</h2>
    <p v-if="success" class="success--text">Password successfully reset.</p>
    <v-text-field
      v-model="current_password"
      :error-messages="errors.current_password"
      label="Current Password"
      prepend-icon="mdi-lock"
      type="password"
    />
    <v-text-field
      v-model="new_password"
      label="New Password"
      :error-messages="errors.new_password"
      prepend-icon="mdi-lock"
      type="password"
    />
    <v-text-field
      v-model="re_new_password"
      label="Repeat Password"
      :error-messages="errors.re_new_password"
      prepend-icon="mdi-lock"
      type="password"
    />
    <v-btn class="primary mt-2" @click.stop="changePassword"
      >Change Password</v-btn
    >
  </v-card>
</template>

<script>
export default {
  name: 'ChangePasswordForm',
  data: () => ({
    current_password: null,
    errors: {},
    new_password: null,
    re_new_password: null,
    reset: false
  }),
  methods: {
    changePassword() {
      this.errors = {}
      this.success = false
      const formData = {
        current_password: this.current_password,
        new_password: this.new_password,
        re_new_password: this.re_new_password
      }
      if (formData.new_password !== formData.re_new_password) {
        this.errors.re_new_password = 'Passwords must match'
        return
      }
      this.$axios
        .post('/api/v2/auth/users/set_password/', formData)
        .then((response) => {
          this.resetForm()
          this.success = true
        })
        .catch((err) => {
          this.errors = err.response.data
        })
    },
    resetForm() {
      this.current_password = null
      this.new_password = null
      this.re_new_password = null
    }
  }
}
</script>
