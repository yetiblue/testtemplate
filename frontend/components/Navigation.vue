<template>
  <v-list>
    <v-list-item v-for="link in links" :key="link.title">
      <nuxt-link :to="link.to" class="navLink d-flex align-center">
        <v-icon color="primary">{{ link.icon }}</v-icon>
        <span class="ml-2 title primary--text font-weight-light">{{
          link.title
        }}</span>
      </nuxt-link>
    </v-list-item>
  </v-list>
</template>

<script>
export default {
  name: 'Navigation',
  computed: {
    links() {
      const universal = [
        { icon: 'mdi-home', to: '/', title: 'Home' },
        { icon: 'mdi-chart-bubble', to: '/about', title: 'About' }
      ]
      if (this.$auth.loggedIn) {
        return universal.concat([
          { icon: 'mdi-account-cog', to: '/account', title: 'Account' },
          { icon: 'mdi-login', to: '/logout', title: 'Logout' }
        ])
      } else {
        return universal.concat([
          { icon: 'mdi-login', to: '/login', title: 'Login' }
        ])
      }
    }
  }
}
</script>

<style>
.navLink {
  text-decoration: none;
}
</style>
