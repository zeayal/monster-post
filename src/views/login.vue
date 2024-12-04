<template>
  <div class="app-container">
    <!-- logo图标 -->
    <img class="logo" src="./assets/logo.jpeg" alt="" />
    <!-- 登录界面 -->
    <div class="login_container">
      <!-- 二维码 -->
      <div class="qr">
        <h2 class="qr_title">手机扫码的登录</h2>
        <div class="qr_codeText">
          <QrcodeVue3 :value="qrCodeText">测试</QrcodeVue3>
        </div>
        <p>打开app，点击左上角扫一扫</p>
      </div>

      <!-- 登录表单：只有当用户名为daisy，密码为123456时可登录成功 -->
      <div class="login">
        <div class="login_title">
          <h2 class="login_title_pass">密码登录1</h2>
          <h2 class="login_title_info">短信登录</h2>
        </div>

        <form id="login_form">
          <div class="login_input_uname">
            <input type="text" id="uname" placeholder="用户名" v-model="uname" />
            <div class="login_input_pass">
              <input type="password" id="password" placeholder="密码" v-model="password" />
              <input type="button" id="forget_pass" value="忘记密码" />
            </div>
          </div>

          <div class="login_input_tel">
            <input type="text" id="tel_num" placeholder="手机号" />
            <div class="login_input_pass">
              <input type="password" id="mes_code" placeholder="验证码" />
              <input type="button" id="get_code" value="获取验证码" />
            </div>
          </div>

          <!-- 登录&重置按钮 -->
          <div class="login_but">
            <button class="login_but_s" @click="login">登录</button>
            <button class="login_but_r" onclick="resetHandle()">重置</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup name="App" lang="ts">
import { onMounted, reactive, ref } from 'vue'
import QrcodeVue3 from 'qrcode-vue3'
import { useRouter } from 'vue-router'

// 数据
const qrCodeText = 'https://baidu.com'
const uname = ref('')
const password = ref('')

const router = useRouter()

// 用户登录测试数据
const validUsers = reactive([
  { username: 'daisy', pass: '123' },
  { username: 'user2', pass: '123456' },
  { username: 'user3', pass: '456' },
])

// 函数
onMounted(() => {
  document.title = '欢迎登录怪兽爪子'
})

function login() {
  const ifUser = validUsers.find(
    (user) => user.pass === password.value && user.username === uname.value,
  )

  if (ifUser) {
    localStorage.setItem('token', '123456')
    router.push('/home')
  } else {
    alert('用户名或密码错误')
  }
}
</script>

<style>
.app-container {
  display: flex;
  flex-direction: column;
  width: 100%;
  height: auto;
  justify-content: center;
  align-items: center;
}

.logo {
  width: 130px;
  height: 130px;
  border-radius: 10px;
  margin: 20px 0 50px 0;
  box-shadow: 10px 10px 10px darkblue;
}

.login_container {
  display: flex;
  justify-content: space-between;
  margin: 0 50px;
}

.login {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 0 50px;
}

.qr_title {
  display: flex;
  flex-direction: column;
  height: 20px;
  width: auto;
  text-align: center;
  justify-content: center;
}

.login_title {
  display: flex;
}

.login_title_pass,
.login_title_info {
  display: flex;
  flex-direction: column;
  height: 20px;
  width: 150px;
  text-align: center;
  justify-content: center;
  cursor: pointer;
}

.login_title_pass {
  color: orange;
  border-right: 2px solid grey;
}

#uname,
#tel_num {
  display: block;
  width: 350px;
  height: 40px;
  background-color: #f3f6f8;
  border-radius: 7px;
  margin: 15px auto;
  border: none;
  padding-left: 20px;
}

.login_input_tel {
  display: none;
}

.login_input_pass {
  display: flex;
  justify-content: center;
  align-items: center;
}

#password,
#mes_code {
  width: 290px;
  height: 40px;
  background-color: #f3f6f8;
  border-radius: 7px 0 0 7px;
  margin: 15px 0;
  border: none;
  padding-left: 20px;
}

#forget_pass,
#get_code {
  width: 60px;
  height: 40px;
  background-color: #f3f6f8;
  border-radius: 0 7px 7px 0;
  margin: 0;
  border: none;
  text-align: right;
  color: red;
  font-size: 10px;
}

/* .login_input_pass {
            display: inner;
        } */

.login_but {
  display: flex;
  text-align: center;
}

.login_but_s,
.login_but_r {
  width: 40%;
  height: 40px;
  background-color: orange;
  border-radius: 7px;
  margin: 15px auto;
  border: none;
}

.login_but_r {
  background-color: gray;
}

@media screen and (max-width: 768px) {
  .login_container {
    flex-direction: column;
    align-items: center;
    margin: 0;
  }

  .qr {
    margin: 0;
    margin-bottom: 10px;
    padding: 0;
    border-right: none;
    border-bottom: 2px solid #f3f6f8;
  }
}

.qr_codeText img {
  width: 200px;
  height: 200px;
}
</style>
