<template>
  <q-page class="flex flex-center">
  <qrcode-stream
    camera="auto"
    @decode="onDecode"
    @init="onInit"
  >
    </qrcode-stream>
  </q-page>
</template>

<style lang="stylus" scoped>
.q-toolbar
  display: none !important
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
        this.$q.fullscreen.request()
      } catch (error) {
        console.log(`QR code scanner init error: ${error.name}`)
      } finally {
        // hide loading indicator
      }
    },
    onDecode (decodedString) {
      if (decodedString) {
        alert(decodedString)
        this.$q.fullscreen.exit()
        this.createEvent(Math.floor(Math.random() * 10) + 1)
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
