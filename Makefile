# =============================
# 🚀 Flutter Project Makefile
# =============================

APP_NAME := teacher_dashboard
GIT_REMOTE := origin
BRANCH := main

# -----------------------------
# 🧱 Setup Project
# -----------------------------
setup:
	@echo "📦 Installing dependencies..."
	flutter pub get
	@echo "🔐 Checking .env file..."
	cp .env.example .env || echo ".env already exists"

# -----------------------------
# 🧹 Clean Project
# -----------------------------
clean:
	@echo "🧹 Cleaning project..."
	flutter clean
	flutter pub get

# -----------------------------
# ▶ Run App
# -----------------------------
run:
	@echo "🚀 Running app..."
	flutter run

# -----------------------------
# 📦 Build
# -----------------------------
build-apk:
	@echo "📱 Building APK (release)..."
	flutter build apk --release

build-web:
	@echo "🌐 Building Web (release)..."
	flutter build web --release

# -----------------------------
# 🌿 Git Init + First Push
# -----------------------------
git-init:
	@echo "🌿 Initializing Git repo..."
	git init
	@echo "➕ Adding files..."
	git add .
	@echo "💾 First commit..."
	git commit -m "initial commit"
	@echo "🌱 Setting branch to $(BRANCH)..."
	git branch -M $(BRANCH)

# -----------------------------
# 🔗 Connect Remote
# -----------------------------
git-remote:
	@echo "🔗 Connecting to remote repo..."
	git remote add $(GIT_REMOTE) $(url)

# -----------------------------
# 🚀 Push Code
# -----------------------------
git-push:
	@echo "🚀 Pushing to GitHub..."
	git push -u $(GIT_REMOTE) $(BRANCH)

# -----------------------------
# 🔄 Quick Push (all in one)
# -----------------------------
quick-push:
	@echo "🔄 Quick push..."
	git add .
	git commit -m "Quick push"
	git push

# -----------------------------
# 📥 Pull
# -----------------------------
pull:
	@echo "📥 Pulling latest changes..."
	git pull

# -----------------------------
# 🔥 Full Setup (مرة واحدة)
# -----------------------------
init-all:
	@echo "🔥 Starting full project setup..."
	make setup
	make git-init
	make git-remote url=$(url)
	make git-push
	@echo "✅ Project is ready and pushed!"

# example:
#  make init-all url=https://github.com/username/repo