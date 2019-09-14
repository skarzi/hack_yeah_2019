<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <q-toolbar-title>
          Hello {{ username }}
        </q-toolbar-title>
      </q-toolbar>
    </q-header>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import { createNamespacedHelpers } from 'vuex'

let userProfileNamespace = createNamespacedHelpers('userProfile')

export default {
  name: 'MyLayout',
  data () {
    return {
    }
  },
  computed: {
    ...userProfileNamespace.mapState(['username'])
  }
}
</script>

<style lang="stylus" scoped>
</style>
