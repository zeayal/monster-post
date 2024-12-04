<template>
  <RouterView />
</template>

<script setup name="App" lang="ts">
import { onMounted } from 'vue'
import { useRouter } from 'vue-router'
onMounted(() => {
  console.log('app')
  const router = useRouter()
  const token = localStorage.getItem('token')
  console.log('token', token)
  if (!token) {
    router.replace('/login')
  }
})
</script>
