<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disco.com</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- Auth Screen -->
    <div id="auth-screen" class="card">
        <h2>Disco Login</h2>
        <input type="text" id="username" placeholder="Enter Username">
        <div class="role-selector">
            <label><input type="radio" name="role" value="user" checked> User</label>
            <label><input type="radio" name="role" value="coordinator"> Coordinator (You)</label>
        </div>
        <button onclick="login()">Sign In</button>
    </div>

    <!-- Main Dashboard -->
    <div id="dashboard" class="hidden">
        <header>
            <h1 id="welcome-text">Dashboard</h1>
            <button class="logout-btn" onclick="logout()">Logout</button>
        </header>

        <div class="app-layout">
            <!-- User Interface: Create Ticket -->
            <div id="user-view" class="card hidden">
                <h3>Report a Software Problem</h3>
                <input type="text" id="issue-title" placeholder="What is the problem? (e.g., Login Crash)">
                <textarea id="issue-desc" placeholder="Describe the steps to reproduce or details..."></textarea>
                <button onclick="createTicket()">Submit Ticket</button>
            </div>

            <!-- Coordinator Interface: Ticket Sidebar -->
            <div id="coordinator-view" class="card hidden">
                <h3>Active Support Tickets</h3>
                <ul id="ticket-list"></ul>
            </div>

            <!-- Chat Window (Shared) -->
            <div id="chat-view" class="card hidden">
                <h3 id="chat-title">Ticket Discussion</h3>
                <div id="chat-box" class="chat-box"></div>
                <div class="chat-input-area">
                    <input type="text" id="chat-message" placeholder="Type a message...">
                    <button onclick="sendMessage()">Send</button>
                </div>
            </div>
        </div>
    </div>

    <script src="app.js"></script>
</body>
</html>
