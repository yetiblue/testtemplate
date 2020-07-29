<template>
  <v-app>
    <v-app-bar fixed app>
      <v-toolbar-title class="primary--text font-weight-light" v-text="title" />
      <v-spacer />
      <v-btn icon @click.stop="rightDrawer = !rightDrawer">
        <v-icon color="primary">mdi-menu</v-icon>
      </v-btn>
    </v-app-bar>
    <v-content>
      <v-container class="primary--text">
        <nuxt />
      </v-container>
    </v-content>
    <v-navigation-drawer v-model="rightDrawer" right temporary fixed>
      <Navigation />
    </v-navigation-drawer>
  </v-app>
</template>

<script>
import Navigation from '@/components/Navigation'

export default {
  components: {
    Navigation
  },
  data() {
    return {
      rightDrawer: false,
      title: 'Coming Soon'
    }
  }
}
</script>

<style>
.v-card__title {
  word-break: break-word !important;
}
</style>
