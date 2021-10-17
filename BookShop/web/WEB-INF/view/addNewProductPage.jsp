<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
    <link rel="stylesheet" href="asset/styles.css" type="text/css" />
    <jsp:include page="./commonView/Navbar.jsp">
      <jsp:param name="title" value="Sannin SC |  Add Room" />
    </jsp:include>
  </head>
  <body>
    <form class="p-2 lg:p-7 space-y-8 divide-y divide-gray-200">
      <div class="space-y-8 divide-y divide-gray-200 sm:space-y-5">
        <div>
          <div class="mb-3">
            <h3 class="text-lg leading-6 font-medium text-gray-900">
              Add new product
            </h3>
            <p class="mt-1 max-w-2xl text-sm text-gray-500">
              Fullfill the form below to add new product into your shop
            </p>
          </div>
          <div
            class="
              sm:grid
              sm:grid-cols-3
              sm:gap-4
              sm:items-start
              sm:border-t
              sm:border-gray-200
              sm:pt-5
            "
          >
            <label
              for="name"
              class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2"
            >
              Name
            </label>
            <div class="mt-1 sm:mt-0 sm:col-span-2">
              <input
                type="text"
                name="name"
                id="name"
                autocomplete="name"
                class="
                  max-w-lg
                  block
                  w-full
                  shadow-sm
                  focus:ring-indigo-500 focus:border-indigo-500
                  sm:max-w-xs sm:text-sm
                  border-gray-300
                  rounded-md
                "
              />
            </div>
          </div>
          <div class="mt-6 sm:mt-5 space-y-6 sm:space-y-5">
            <div
              class="
                sm:grid
                sm:grid-cols-3
                sm:gap-4
                sm:items-start
                sm:border-t
                sm:border-gray-200
                sm:pt-5
              "
            >
              <label
                for="price"
                class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2"
              >
                price
              </label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <div class="max-w-lg flex rounded-md shadow-sm">
                  <input
                    type="number"
                    name="price"
                    id="price"
                    autocomplete="price"
                    class="
                      flex-1
                      block
                      w-full
                      focus:ring-indigo-500 focus:border-indigo-500
                      min-w-0
                      rounded-none rounded-r-md
                      sm:text-sm
                      border-gray-300
                    "
                  />
                </div>
              </div>
            </div>
            <div
              class="
                sm:grid
                sm:grid-cols-3
                sm:gap-4
                sm:items-start
                sm:border-t
                sm:border-gray-200
                sm:pt-5
              "
            >
              <label
                for="quantity"
                class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2"
              >
                quantity
              </label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <div class="max-w-lg flex rounded-md shadow-sm">
                  <input
                    type="number"
                    name="quantity"
                    id="quantity"
                    autocomplete="quantity"
                    class="
                      flex-1
                      block
                      w-full
                      focus:ring-indigo-500 focus:border-indigo-500
                      min-w-0
                      rounded-none rounded-r-md
                      sm:text-sm
                      border-gray-300
                    "
                  />
                </div>
              </div>
            </div>
            <div
              class="
                sm:grid
                sm:grid-cols-3
                sm:gap-4
                sm:items-start
                sm:border-t
                sm:border-gray-200
                sm:pt-5
              "
            >
              <label
                for="publishedDate "
                class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2"
              >
                Published Date
              </label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <div class="max-w-lg flex rounded-md shadow-sm">
                  <input
                    type="date"
                    name="publishedDate "
                    id="publishedDate "
                    autocomplete="publishedDate "
                    class="
                      flex-1
                      block
                      w-full
                      focus:ring-indigo-500 focus:border-indigo-500
                      min-w-0
                      rounded-none rounded-r-md
                      sm:text-sm
                      border-gray-300
                    "
                  />
                </div>
              </div>
            </div>
            <div
              class="
                sm:grid
                sm:grid-cols-3
                sm:gap-4
                sm:items-start
                sm:border-t
                sm:border-gray-200
                sm:pt-5
              "
            >
              <label
                for="type"
                class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2"
              >
                Type
              </label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <select
                  id="type"
                  name="type"
                  autocomplete="type"
                  class="
                    max-w-lg
                    block
                    focus:ring-indigo-500 focus:border-indigo-500
                    w-full
                    shadow-sm
                    sm:max-w-xs sm:text-sm
                    border-gray-300
                    rounded-md
                  "
                >
                  <option>Romance</option>
                  <option>Horror</option>
                  <option>Action</option>
                </select>
              </div>
            </div>
            <div
              class="
                sm:grid
                sm:grid-cols-3
                sm:gap-4
                sm:items-center
                sm:border-t
                sm:border-gray-200
                sm:pt-5
              "
            >
              <label
                for="photo"
                class="block text-sm font-medium text-gray-700"
              >
                Photo
              </label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <input
                  type="file"
                  id="image"
                  name="image"
                  class="
                    bg-white
                    py-2
                    rounded-md
                    shadow-sm
                    text-sm
                    leading-4
                    font-medium
                    text-gray-700
                    hover:bg-gray-50
                    focus:outline-none
                    focus:ring-2
                    focus:ring-offset-2
                    focus:ring-indigo-500
                  "
                  value="upload"
                />
              </div>
            </div>
            <div
              class="
                sm:grid
                sm:grid-cols-3
                sm:gap-4
                sm:items-start
                sm:border-t
                sm:border-gray-200
                sm:pt-5
              "
            >
              <label
                for="description"
                class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2"
              >
                Description
              </label>
              <div class="mt-1 sm:mt-0 sm:col-span-2">
                <textarea
                  id="description"
                  name="description"
                  rows="3"
                  class="
                    max-w-lg
                    shadow-sm
                    block
                    w-full
                    focus:ring-indigo-500 focus:border-indigo-500
                    sm:text-sm
                    border border-gray-300
                    rounded-md
                  "
                ></textarea>
                <p class="mt-2 text-sm text-gray-500">
                  Write a few sentences about product.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="pt-5">
        <div class="flex justify-end">
          <button
            type="button"
            class="
              bg-white
              py-2
              px-4
              border border-gray-300
              rounded-md
              shadow-sm
              text-sm
              font-medium
              text-gray-700
              hover:bg-gray-50
              focus:outline-none
              focus:ring-2
              focus:ring-offset-2
              focus:ring-indigo-500
            "
          >
            Cancel
          </button>
          <button
            type="submit"
            class="
              ml-3
              inline-flex
              justify-center
              py-2
              px-4
              border border-transparent
              shadow-sm
              text-sm
              font-medium
              rounded-md
              text-white
              bg-indigo-600
              hover:bg-indigo-700
              focus:outline-none
              focus:ring-2
              focus:ring-offset-2
              focus:ring-indigo-500
            "
          >
            Save
          </button>
        </div>
      </div>
    </form>
  </body>
</html>
