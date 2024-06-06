<header class="header">
    <div class="container">
        <div class="header-content">
            <div class="header-line">
                <div class="navbar-actions">
                    <div class="navbar-brand">
                        <a href="{{ route("student_dashboard") }}">
                            <img class="light-theme" src="{{ asset("assets/student_assets/images/logo-white.png") }}" alt="logo">
                            <img class="dark-theme" src="{{ asset("assets/student_assets/images/logo-dark.png") }}" alt="logo">
                            <!-- <h3>مَرِن</h3> -->
                        </a>
                    </div>
                </div>

                <div class="navbar-actions">
                    <div class="sidemenu-trigger">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M7.5 11.5C5.01472 11.5 3 9.48528 3 7C3 4.51472 5.01472 2.5 7.5 2.5C9.98528 2.5 12 4.51472 12 7C12 9.48528 9.98528 11.5 7.5 11.5ZM7.5 21.5C5.01472 21.5 3 19.4853 3 17C3 14.5147 5.01472 12.5 7.5 12.5C9.98528 12.5 12 14.5147 12 17C12 19.4853 9.98528 21.5 7.5 21.5ZM17.5 11.5C15.0147 11.5 13 9.48528 13 7C13 4.51472 15.0147 2.5 17.5 2.5C19.9853 2.5 22 4.51472 22 7C22 9.48528 19.9853 11.5 17.5 11.5ZM17.5 21.5C15.0147 21.5 13 19.4853 13 17C13 14.5147 15.0147 12.5 17.5 12.5C19.9853 12.5 22 14.5147 22 17C22 19.4853 19.9853 21.5 17.5 21.5ZM7.5 9.5C8.88071 9.5 10 8.38071 10 7C10 5.61929 8.88071 4.5 7.5 4.5C6.11929 4.5 5 5.61929 5 7C5 8.38071 6.11929 9.5 7.5 9.5ZM7.5 19.5C8.88071 19.5 10 18.3807 10 17C10 15.6193 8.88071 14.5 7.5 14.5C6.11929 14.5 5 15.6193 5 17C5 18.3807 6.11929 19.5 7.5 19.5ZM17.5 9.5C18.8807 9.5 20 8.38071 20 7C20 5.61929 18.8807 4.5 17.5 4.5C16.1193 4.5 15 5.61929 15 7C15 8.38071 16.1193 9.5 17.5 9.5ZM17.5 19.5C18.8807 19.5 20 18.3807 20 17C20 15.6193 18.8807 14.5 17.5 14.5C16.1193 14.5 15 15.6193 15 17C15 18.3807 16.1193 19.5 17.5 19.5Z"></path></svg>
                    </div>
                </div>

            </div>

            <div class="header-line search">
                <div class="navbar-actions search-bar">
                    <form>
                        <div class="form-group">
                        <input type="text" class="form-control" placeholder="اكتب كود الأختبار , الفيديو او اللايف">
                        <span>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M18.031 16.6168L22.3137 20.8995L20.8995 22.3137L16.6168 18.031C15.0769 19.263 13.124 20 11 20C6.032 20 2 15.968 2 11C2 6.032 6.032 2 11 2C15.968 2 20 6.032 20 11C20 13.124 19.263 15.0769 18.031 16.6168ZM16.0247 15.8748C17.2475 14.6146 18 12.8956 18 11C18 7.1325 14.8675 4 11 4C7.1325 4 4 7.1325 4 11C4 14.8675 7.1325 18 11 18C12.8956 18 14.6146 17.2475 15.8748 16.0247L16.0247 15.8748Z"></path></svg>
                        </span>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>

            <div class="header-line">

                <div class="action-list">
                    <ul class="list-unstyled p-0">

                        <li class="dark-mode">
                            <div class="a moon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M16 20.3346V18.1351C17.6993 17.2368 19.012 15.7048 19.6233 13.8538C19.0927 13.9506 18.5498 14.0001 18 14.0001C13.0294 14.0001 9 9.97071 9 5.00015C9 4.95455 9.00034 4.909 9.00102 4.86349C7.04146 5.89887 5.60285 7.77593 5.15045 10.0001H3.11775C3.79375 5.73838 7.30375 2.42018 11.6562 2.03711C11.2352 2.93693 11 3.94108 11 5.00015C11 8.86614 14.134 12.0001 18 12.0001C19.475 12.0001 20.8435 11.5439 21.972 10.7649C21.9905 11.0076 22 11.2527 22 11.5001C22 15.5108 19.5146 18.9411 16 20.3346ZM7 20.0001H14V22.0001H7V20.0001ZM4 12.0001H10V14.0001H4V12.0001ZM2 16.0001H12V18.0001H2V16.0001Z"></path></svg>
                            </div>
                            <div class="a sun">
                                <svg viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 18a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM11 1h2v3h-2V1zm0 19h2v3h-2v-3zM3.515 4.929l1.414-1.414L7.05 5.636 5.636 7.05 3.515 4.93zM16.95 18.364l1.414-1.414 2.121 2.121-1.414 1.414-2.121-2.121zm2.121-14.85l1.414 1.415-2.121 2.121-1.414-1.414 2.121-2.121zM5.636 16.95l1.414 1.414-2.121 2.121-1.414-1.414 2.121-2.121zM23 11v2h-3v-2h3zM4 11v2H1v-2h3z" /></svg>
                            </div>
                        </li>

                        <li hidden class="shop-card">
                            <div class="a">
                                <svg viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22H4a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h16a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1zm-1-2V4H5v16h14zM9 6v2a3 3 0 0 0 6 0V6h2v2A5 5 0 0 1 7 8V6h2z"/></svg>
                            </div>
                        </li>

                        <li class="messages">
                            <div class="a">
                                <svg viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M2 8.994A5.99 5.99 0 0 1 8 3h8c3.313 0 6 2.695 6 5.994V21H8c-3.313 0-6-2.695-6-5.994V8.994zM20 19V8.994A4.004 4.004 0 0 0 16 5H8a3.99 3.99 0 0 0-4 3.994v6.012A4.004 4.004 0 0 0 8 19h12zm-6-8h2v2h-2v-2zm-6 0h2v2H8v-2z"/></svg>
                            </div>
                        </li>

                        <li class="noti">
                            <div class="a">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M5 18H19V11.0314C19 7.14806 15.866 4 12 4C8.13401 4 5 7.14806 5 11.0314V18ZM12 2C16.9706 2 21 6.04348 21 11.0314V20H3V11.0314C3 6.04348 7.02944 2 12 2ZM9.5 21H14.5C14.5 22.3807 13.3807 23.5 12 23.5C10.6193 23.5 9.5 22.3807 9.5 21Z"></path></svg>
                            </div>
                        </li>

                    </ul>
                </div>

                <div class="user-action">
                    <div class="d-flex">
                        <div class="user-icon">
                            <figure
                            style="background-image: url({{ asset("public/app/".$teacher->img_url)}})">
                            </figure>
                        </div>
                        <div class="user-action-info">
                            <h3>{{ $teacher->name }}</h3>
                            <span class="active-account"><span class="exp-text">{{ $teacher->subject }}</span></span>
                        </div>
                    </div>
                    <div class="toggle-account-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M18.2073 9.04304 12.0002 2.83594 5.79312 9.04304 7.20733 10.4573 12.0002 5.66436 16.7931 10.4573 18.2073 9.04304ZM5.79297 14.9574 12.0001 21.1646 18.2072 14.9574 16.793 13.5432 12.0001 18.3361 7.20718 13.5432 5.79297 14.9574Z"></path></svg>
                    </div>
                </div>

                <!-- <div class="navbar-actions exp">
                    <div class="star-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <path d="M14 18V16H10V18L9 20H15L14 18Z" fill="black"/>
                            <path opacity="0.3" d="M20 4H17V3C17 2.4 16.6 2 16 2H8C7.4 2 7 2.4 7 3V4H4C3.4 4 3 4.4 3 5V9C3 11.2 4.8 13 7 13C8.2 14.2 8.8 14.8 10 16H14C15.2 14.8 15.8 14.2 17 13C19.2 13 21 11.2 21 9V5C21 4.4 20.6 4 20 4ZM5 9V6H7V11C5.9 11 5 10.1 5 9ZM19 9C19 10.1 18.1 11 17 11V6H19V9ZM17 21V22H7V21C7 20.4 7.4 20 8 20H16C16.6 20 17 20.4 17 21ZM10 9C9.4 9 9 8.6 9 8V5C9 4.4 9.4 4 10 4C10.6 4 11 4.4 11 5V8C11 8.6 10.6 9 10 9ZM10 13C9.4 13 9 12.6 9 12V11C9 10.4 9.4 10 10 10C10.6 10 11 10.4 11 11V12C11 12.6 10.6 13 10 13Z" fill="black"/>
                        </svg>
                    </div>
                    <span class="exp-points">3520 <span class="span-text">نقطة خبرة</span></span>
                </div> -->
            </div>
        </div>
    </div>
</header>
