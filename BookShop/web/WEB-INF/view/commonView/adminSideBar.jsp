<%@page import="constant.Router"%> <%@page contentType="text/html"
pageEncoding="UTF-8"%>

<div class="hidden md:flex md:w-64 md:flex-col  md:inset-y-0">
  <div class="flex flex-col flex-1 min-h-0 bg-gray-800">
    <div class="flex flex-col flex-1 pt-5 pb-4 overflow-y-auto">
      <div class="flex items-center justify-center flex-shrink-0 w-full px-4">
        <img
          class="w-auto h-8 align-center"
          src="asset/logoFull.png"
          alt="Workflow"
        />
      </div>
      <nav class="flex-1 px-2 mt-5 space-y-1">
        <a
          href="<%= Router.ADMIN_ORDER_CONTROLLER %>"
          class="
            flex
            items-center
            px-2
            py-2
            text-sm
            font-medium
            text-white
            rounded-md
            hover:bg-gray-900
            group
          "
        >
          <svg
            class="flex-shrink-0 w-6 h-6 mr-3 text-white"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M7.5 7.67001V6.70001C7.5 4.45001 9.31 2.24001 11.56 2.03001C14.24 1.77001 16.5 3.88001 16.5 6.51001V7.89001"
              stroke="white"
              stroke-width="1.5"
              stroke-miterlimit="10"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M8.99983 22H14.9998C19.0198 22 19.7398 20.39 19.9498 18.43L20.6998 12.43C20.9698 9.99 20.2698 8 15.9998 8H7.99983C3.72983 8 3.02983 9.99 3.29983 12.43L4.04983 18.43C4.25983 20.39 4.97983 22 8.99983 22Z"
              stroke="white"
              stroke-width="1.5"
              stroke-miterlimit="10"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M15.4955 12H15.5045"
              stroke="white"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M8.49451 12H8.50349"
              stroke="white"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
          </svg>

          View order
        </a>
        <a
          href="<%= Router.ADD_CATEGORY_CONTROLLER %>"
          class="
            flex
            items-center
            px-2
            py-2
            text-sm
            font-medium
            text-white
            rounded-md
            hover:bg-gray-900
            group
          "
        >
          <svg
            class="flex-shrink-0 w-6 h-6 mr-3 text-white"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M22 8.52V3.98C22 2.57 21.36 2 19.77 2H15.73C14.14 2 13.5 2.57 13.5 3.98V8.51C13.5 9.93 14.14 10.49 15.73 10.49H19.77C21.36 10.5 22 9.93 22 8.52Z"
              stroke="white"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M22 19.77V15.73C22 14.14 21.36 13.5 19.77 13.5H15.73C14.14 13.5 13.5 14.14 13.5 15.73V19.77C13.5 21.36 14.14 22 15.73 22H19.77C21.36 22 22 21.36 22 19.77Z"
              stroke="white"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M10.5 8.52V3.98C10.5 2.57 9.86 2 8.27 2H4.23C2.64 2 2 2.57 2 3.98V8.51C2 9.93 2.64 10.49 4.23 10.49H8.27C9.86 10.5 10.5 9.93 10.5 8.52Z"
              stroke="white"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M10.5 19.77V15.73C10.5 14.14 9.86 13.5 8.27 13.5H4.23C2.64 13.5 2 14.14 2 15.73V19.77C2 21.36 2.64 22 4.23 22H8.27C9.86 22 10.5 21.36 10.5 19.77Z"
              stroke="white"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
          </svg>

          Add category
        </a>
        <a
          href="<%= Router.ADD_PRODUCT_CONTROLLER %>"
          class="
            flex
            items-center
            px-2
            py-2
            text-sm
            font-medium
            text-white
            rounded-md
            hover:bg-gray-900
            group
          "
        >
          <svg
            class="flex-shrink-0 w-6 h-6 mr-3 text-white"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M23 18C23 18.75 22.79 19.46 22.42 20.06C22.21 20.42 21.94 20.74 21.63 21C20.93 21.63 20.01 22 19 22C17.78 22 16.69 21.45 15.97 20.59C15.95 20.56 15.92 20.54 15.9 20.51C15.78 20.37 15.67 20.22 15.58 20.06C15.21 19.46 15 18.75 15 18C15 16.74 15.58 15.61 16.5 14.88C17.19 14.33 18.06 14 19 14C20 14 20.9 14.36 21.6 14.97C21.72 15.06 21.83 15.17 21.93 15.28C22.59 16 23 16.95 23 18Z"
              stroke="white"
              stroke-width="1.5"
              stroke-miterlimit="10"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M20.4898 17.98H17.5098"
              stroke="white"
              stroke-width="1.5"
              stroke-miterlimit="10"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M19 16.52V19.51"
              stroke="white"
              stroke-width="1.5"
              stroke-miterlimit="10"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M3.16992 7.44L11.9999 12.55L20.7699 7.46997"
              stroke="white"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M12 21.61V12.54"
              stroke="white"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M21.6096 9.17V14.83C21.6096 14.88 21.6097 14.92 21.5997 14.97C20.8997 14.36 19.9996 14 18.9996 14C18.0596 14 17.1896 14.33 16.4996 14.88C15.5796 15.61 14.9996 16.74 14.9996 18C14.9996 18.75 15.2097 19.46 15.5797 20.06C15.6697 20.22 15.7796 20.37 15.8996 20.51L14.0697 21.52C12.9297 22.16 11.0696 22.16 9.92964 21.52L4.58965 18.56C3.37965 17.89 2.38965 16.21 2.38965 14.83V9.17C2.38965 7.79 3.37965 6.11002 4.58965 5.44002L9.92964 2.48C11.0696 1.84 12.9297 1.84 14.0697 2.48L19.4097 5.44002C20.6197 6.11002 21.6096 7.79 21.6096 9.17Z"
              stroke="white"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
          </svg>

          Add product
        </a>
        <a
          href="#"
          class="
            flex
            items-center
            px-2
            py-2
            text-sm
            font-medium
            text-white
            rounded-md
            hover:bg-gray-900
            group
          "
        >
          <svg
            class="flex-shrink-0 w-6 h-6 mr-3 text-white"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M3.16992 7.44L11.9999 12.55L20.7699 7.46997"
              stroke="white"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M12 21.61V12.54"
              stroke="white"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M21.6096 12.83V9.17C21.6096 7.79 20.6196 6.11002 19.4096 5.44002L14.0696 2.48C12.9296 1.84 11.0696 1.84 9.92963 2.48L4.58963 5.44002C3.37963 6.11002 2.38965 7.79 2.38965 9.17V14.83C2.38965 16.21 3.37963 17.89 4.58963 18.56L9.92963 21.52C10.4996 21.84 11.2496 22 11.9996 22C12.7496 22 13.4996 21.84 14.0696 21.52"
              stroke="white"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M19.2 21.4C20.9673 21.4 22.4 19.9673 22.4 18.2C22.4 16.4327 20.9673 15 19.2 15C17.4327 15 16 16.4327 16 18.2C16 19.9673 17.4327 21.4 19.2 21.4Z"
              stroke="white"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M23 22L22 21"
              stroke="white"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
          </svg>
          View product
        </a>
      </nav>
    </div>
  </div>
</div>
