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
	flutter pub get
	cp .env.example .env || echo ".env exists"

# -----------------------------
# 🧹 Clean Project
# -----------------------------
clean:
	flutter clean
	flutter pub get

# -----------------------------
# ▶ Run App
# -----------------------------
run:
	flutter run

# -----------------------------
# 📦 Build
# -----------------------------
build-apk:
	flutter build apk --release

build-web:
	flutter build web --release

# -----------------------------
# 🌿 Git Init + First Push
# -----------------------------
git-init:
	git init
	git add .
	git commit -m "initial commit"
	git branch -M $(BRANCH)

# -----------------------------
# 🔗 Connect Remote
# -----------------------------
git-remote:
	git remote add $(GIT_REMOTE) $(url)

# الاستخدام:
# make git-remote url=https://github.com/username/repo.git

# -----------------------------
# 🚀 Push Code
# -----------------------------
git-push:
	git push -u $(GIT_REMOTE) $(BRANCH)

# -----------------------------
# 🔄 Quick Push (all in one)
# -----------------------------
quick-push:
	git add .
	git commit -m "update"
	git push

# -----------------------------
# 📥 Pull
# -----------------------------
pull:
	git pull

# -----------------------------
# 🔥 Full Setup (مرة واحدة)
# -----------------------------
init-all:
	make setup
	make git-init
	make git-remote url=$(url)
	make git-push

# الاستخدام:
