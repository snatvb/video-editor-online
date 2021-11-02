module Avenger = {
  @react.component
  let make = (~className: option<string>=?, ~fill: string="none") => {
    <svg
      ?className
      enableBackground="new 0 0 24 24"
      version="1.1"
      viewBox="0 0 24 24"
      xmlns="http://www.w3.org/2000/svg">
      <g>
        <path
          d="M16.5,5.8000002   c2.3869038,1.5050354,4,4.1696901,4,7.1999998c0,4.694397-3.805603,8.5-8.5,8.5   c-1.132019,0-2.2102051-0.2258301-3.197998-0.6275024l-0.788269,1.8392944C9.2434082,23.2171021,10.5881348,23.5,12,23.5   c5.7990112,0,10.5-4.7010498,10.5-10.5c0-4.1765337-2.4691105-7.8026972-6-9.4941177V0.5h-3l-0.956336,1.9996123l0,0   C12.3741608,2.4914808,12.1715164,2.5,12,2.5C6.2009888,2.5,1.5,7.2009888,1.5,13   c0,1.8676758,0.4929199,3.617981,1.3478394,5.1375122l1.1270142-2.3565063C3.6724243,14.9085693,3.5,13.9754028,3.5,13   c0-4.5466099,3.5962243-8.2681293,8.0857525-8.4974823l0,0L2.5,23.5h3l3-7H14v1l2.5-2l-2.5-2v1H9.5l4.5-10v7l2.5,2V5.8000002z"
          fill
          stroke="currentColor"
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeMiterlimit="10"
        />
        <polygon
          fill
          points="14,19.5    16.5,19.5 16.5,17.5  "
          stroke="currentColor"
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeMiterlimit="10"
        />
      </g>
    </svg>
  }
}

module Creed = {
  @react.component
  let make = (~className: option<string>=?, ~fill: string="none") => {
    <svg
      ?className
      enableBackground="new 0 0 24 24"
      version="1.1"
      viewBox="0 0 24 24"
      xmlSpace="preserve"
      xmlns="http://www.w3.org/2000/svg"
      xmlnsXlink="http://www.w3.org/1999/xlink">
      <path
        d="M11.5,5.4998851  c0,0,5.5801792,9.6045036,6.5,13c0.9244804,3.412693-3.9999018,5-3.9999018,5c3.9978857,0.0177937,4.500001-1,6.000001-2  s3.4999008-1,3.4999008-1c-1.5-2,0-5.000001,0-5.000001s-0.5000992,0.9985304-2,0.9985304  c-1.5000992,0-2.4999008-1.9985304-2.4999008-1.9985304l-7.000001-14L5,14.4998846c0,0-1,2.000001-2.5,2.000001  s-2-1.000001-2-1.000001s1.5,3.000001,0,5.000001c0,0,2,0,3.5,1s2.0021138,2.0177937,6,2c0,0-4.92448-1.587307-4-5  C6.9528885,14.9823217,11.5,5.4998851,11.5,5.4998851z"
        fill
        stroke="currentColor"
        strokeLinecap="round"
        strokeLinejoin="round"
        strokeMiterlimit="10"
      />
    </svg>
  }
}

module DealGlass = {
  @react.component
  let make = (~className: option<string>=?, ~fill: string="none") => {
    <svg
      ?className
      enableBackground="new 0 0 24 24"
      version="1.1"
      viewBox="0 0 24 24"
      xmlSpace="preserve"
      xmlns="http://www.w3.org/2000/svg"
      xmlnsXlink="http://www.w3.org/1999/xlink">
      <g>
        <polygon
          fill
          points="8.5,16.5    8.5,15.5 9.5,15.5 9.5,14.5 10.5,14.5 10.5,11.5 13.5,11.5 13.5,14.5 14.5,14.5 14.5,15.5 15.5,15.5 15.5,16.5 20.5,16.5    20.5,15.5 21.5,15.5 21.5,14.5 22.5,14.5 22.5,13.5 23.5,13.5 23.5,11.5 0.5,11.5 0.5,13.5 1.5,13.5 1.5,14.5 2.5,14.5 2.5,15.5    3.5,15.5 3.5,16.5  "
          stroke="currentColor"
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeMiterlimit="10"
        />
        <rect fill="currentColor" height="1" width="1" x="15" y="12.5" />
        <rect fill="currentColor" height="1" width="1" x="16" y="13.5" />
        <rect fill="currentColor" height="1" width="1" x="17" y="14.5" />
        <rect fill="currentColor" height="1" width="1" x="3" y="12.5" />
        <rect fill="currentColor" height="1" width="1" x="4" y="13.5" />
        <rect fill="currentColor" height="1" width="1" x="5" y="14.5" />
        <polyline
          fill
          points="0.5,11.5    8.5,7.5 10.5,7.5 10.5,8.5  "
          stroke="currentColor"
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeMiterlimit="10"
        />
        <polyline
          fill
          points="23.5,11.5    15.5,7.5 13.5,7.5 13.5,8.5  "
          stroke="currentColor"
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeMiterlimit="10"
        />
      </g>
    </svg>
  }
}

module Translation = {
  @react.component
  let make = (~className: option<string>=?) => {
    <svg viewBox="0 0 512 512" ?className xmlns="http://www.w3.org/2000/svg">
      <g fill="currentColor">
        <path
          d="M380.9709,224.59H312.5155a74.4857,74.4857,0,0,0,.8793-11.415V139.9966a74.32,74.32,0,0,0-74.2359-74.2359H131.03a74.32,74.32,0,0,0-74.2358,74.2359v73.1782A74.32,74.32,0,0,0,131.03,287.4106h68.4724a73.82,73.82,0,0,0-.8962,11.4146v73.1787a74.3194,74.3194,0,0,0,74.2354,74.2354h108.13a74.3194,74.3194,0,0,0,74.2354-74.2354V298.8252A74.3194,74.3194,0,0,0,380.9709,224.59ZM72.7937,213.1748V139.9966A58.3019,58.3019,0,0,1,131.03,81.7607H239.1589a58.3016,58.3016,0,0,1,58.2359,58.2359v73.1782a58.3015,58.3015,0,0,1-58.2359,58.2358H131.03A58.3018,58.3018,0,0,1,72.7937,213.1748ZM386.9709,316.8091h-19.5a120.7225,120.7225,0,0,1-28.8229,50.6914,124.5227,124.5227,0,0,0,22.0022,14.08l10.8838,5.4648a8,8,0,1,1-7.18,14.2989l-10.8838-5.4649A140.1428,140.1428,0,0,1,326.87,378.5714a139.3809,139.3809,0,0,1-26.5289,17.3075l-10.8828,5.4649a8,8,0,0,1-7.18-14.2989l10.8828-5.4648a123.73,123.73,0,0,0,21.943-14.0639,123.9571,123.9571,0,0,1-20.2018-28.6436,8,8,0,1,1,14.2558-7.2647,107.9829,107.9829,0,0,0,17.714,25.062,105.445,105.445,0,0,0,23.8949-39.8608H266.8411a8,8,0,0,1,0-16h52.0654V276.6348a8,8,0,0,1,16,0v24.1743h52.0644a8,8,0,0,1,0,16Z"
        />
        <path
          d="M199.4075,133.6084c-2.6123-6.4614-8.0967-10.4756-14.313-10.4756s-11.7012,4.0142-14.3135,10.4761l-34.5347,85.4316a8,8,0,1,0,14.834,5.9961l12.9473-32.0288H206.161l12.9472,32.0288a8,8,0,1,0,14.8339-5.9961Zm-28.912,43.3994,14.599-36.1147,14.5988,36.1147Z"
        />
      </g>
    </svg>
  }
}

module Github = {
  @react.component
  let make = (~className: option<string>=?) => {
    <svg ?className viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
      <path
        d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"
        fill="none"
        stroke="currentColor"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  }
}