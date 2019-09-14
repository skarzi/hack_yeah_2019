<template>
  <q-page class="flex justify-center items-start">
    <div class="row full-width q-px-md">
      <div class="col-xs-12">
        <div class="row items-center">
          <div class="text-left col-xs-10">
            <h5>
              Collected cigarette butts amount:
            </h5>
          </div>
          <div class="col-xs-1">
            <h4>
              {{ totalCigaretteButtsNumber }}
            </h4>
          </div>
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
    ...userProfileNamespace.mapGetters(['totalCigaretteButtsNumber'])
  }
}
</script>
