<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
	<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
        <div class="sidebar-brand-text mx-3">Q&A BOARD</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <sec:authorize access="hasRole('ROLE_ADMIN')">
		  <li class="nav-item">
	        <a class="nav-link" href="/dashBoard">
	          <i class="fas fa-fw fa-tachometer-alt"></i>
	          <span class="font-weight-bolder">Dashboard</span></a>
	      </li>
	  </sec:authorize>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="/">
          <i class="fas fa-fw fa-cog"></i>
          <span>고객 문의</span>
        </a>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="/sb_userInfo">
          <i class="fas fa-fw fa-wrench"></i>
          <span>나의 정보</span>
        </a>
      </li>
      
       <!-- Nav Item - home -->
      <li class="nav-item">
        <a class="nav-link" href="/homeTax/sb_homeTax">
          <i class="fas fa-fw fa-table"></i>
          <span>Home Tax</span></a>
      </li>
      <!-- Divider -->
      <hr class="sidebar-divider">
      

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->