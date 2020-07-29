<template>
  <v-container>
    <v-card class="pa-4 mb-4">
      <h2 class="title font-weight-thin">Account</h2>
      <v-text-field
        v-model="first_name"
        label="First Name"
        prepend-icon="mdi-rename-box"
      />
      <v-text-field
        v-model="last_name"
        label="Last Name"
        prepend-icon="mdi-rename-box"
      />
    </v-card>
    <ChangePasswordForm />
  </v-container>
</template>

<script>
import ChangePasswordForm from '@/forms/ChangePassword'

export default {
  name: 'SettingsPage',
  components: {
    ChangePasswordForm
  },
  data: () => ({
    errors: {},
    first_name: null,
    last_name: null
  })
}
</script>
