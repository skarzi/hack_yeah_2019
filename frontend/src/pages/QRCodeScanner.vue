<template>
  <q-page class="flex flex-center">
    <q-header elevated>
      <q-toolbar>
        <q-toolbar-title>
          Scan QR code
        </q-toolbar-title>
      </q-toolbar>
    </q-header>
    <qrcode-stream
      camera="auto"
      @decode="onDecode"
      @init="onInit"
    >
      </qrcode-stream>
  </q-page>
</template>

<style lang="stylus" scoped>
</style>

<script>
import { createNamespacedHelpers } from 'vuex'

import { QrcodeStream } from 'vue-qrcode-reader'

let userProfileNamespace = createNamespacedHelpers('userProfile')

export default {
  name: 'PageQRCodeScanner',
  components: {
    QrcodeStream
  },
  data () {
    return {
    }
  },
  methods: {
    ...userProfileNamespace.mapActions(['addEvent']),
    async onInit (promise) {
      // show loading indicator

      try {
        await promise
        // successfully initialized
      } catch (error) {
        console.log(`QR code scanner init error: ${error.name}`)
      } finally {
        // hide loading indicator
      }
    },
    onDecode (decodedString) {
      let cigaretteButtsNumber = parseInt(decodedString)
      if (cigaretteButtsNumber) {
        this.createEvent(cigaretteButtsNumber)
        this.$router.push('/')
      }
    },
    createEvent (cigaretteButtsAmount) {
      let event = {
        amount: cigaretteButtsAmount,
        datetime: new Date(),
        location: 'Hack Yeah'
      }
      this.addEvent(event)
    }
  }
}
</script>
