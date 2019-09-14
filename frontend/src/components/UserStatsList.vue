<template>
  <q-list
    bordered
    separator
  >
      <q-item
        v-for="event in events"
        :key="event.id"
        v-ripple
      >
        <q-item-section avatar>
          <q-avatar color="primary" text-color="white">
            {{ event.amount }}
          </q-avatar>
        </q-item-section>

        <q-item-section>
          <q-item-label>{{ event.location }}</q-item-label>
          <q-item-label
            caption
            lines="1"
          >
            {{ formatDatetime(event.datetime) }}
          </q-item-label>
        </q-item-section>
      </q-item>
  </q-list>
</template>

<style lang="stylus" scoped>
</style>

<script>
import { createNamespacedHelpers } from 'vuex'

let userProfileNamespace = createNamespacedHelpers('userProfile')

export default {
  name: 'UserStatsList',
  computed: {
    ...userProfileNamespace.mapGetters(['events'])
  },
  methods: {
    formatDatetime (datetime) {
      return (
        datetime.getFullYear() +
        '-' + this.pad(datetime.getMonth(), 2) +
        '-' + this.pad(datetime.getDate(), 2) +
        ' ' + this.pad(datetime.getHours(), 2) +
        ':' + this.pad(datetime.getMinutes(), 2) +
        ':' + this.pad(datetime.getSeconds(), 2)
      )
    },
    pad (thing, n, padChar = '0') {
      let string = thing.toString()
      return (padChar * n + string).slice(Math.min(-n, string.length))
    }
  }
}
</script>
