<template>
  <q-page class="flex justify-center items-start">
    <q-header elevated>
      <q-toolbar>
        <q-toolbar-title>
          Hello {{ username }}
        </q-toolbar-title>
      </q-toolbar>
    </q-header>
    <div class="row full-width q-px-md">
      <div class="col-xs-12">
        <div class="text-h5 q-my-md">
          Collected cigarette's butts:
        </div>
        <div class="text-bold text-h4 q-pb-lg">
          {{ totalCigaretteButtsNumber }}
        </div>
      </div>
      <div class="col-xs-12">
        <UserStatsList />
      </div>
    </div>
    <q-page-sticky
      position="bottom-right"
      :offset="[25, 45]"
    >
      <q-btn
        color="primary"
        icon="camera"
        size="xl"
        to="/qr-code-scanner"
        fab
      />
    </q-page-sticky>
  </q-page>
</template>

<style lang="stylus" scoped>
</style>

<script>
import { createNamespacedHelpers } from 'vuex'

import UserStatsList from '../components/UserStatsList'

let userProfileNamespace = createNamespacedHelpers('userProfile')

export default {
  name: 'PageIndex',
  components: {
    UserStatsList
  },
  data () {
    return {
    }
  },
  computed: {
    ...userProfileNamespace.mapState(['username']),
    ...userProfileNamespace.mapGetters(['totalCigaretteButtsNumber'])
  }
}
</script>
