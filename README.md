# 🦊 LibertarianCoreOS 🦡
> **"Your hardware, your data, your sovereignty."**
> 
LibertarianCoreOS is an immutable, polyvalent operating system (Workstation & Gaming) built on top of **Bazzite**. It is engineered for digital sovereignty and designed to resist increasingly orwellian digital policies.
This isn't just another Linux distro; it's a statement.
## 🛠 Features
 * **Immutable Foundation**: Based on Fedora Atomic (via Bazzite/BlueBuild) for rock-solid stability.
 * **Privacy-First**: Hardened out-of-the-box to minimize tracking and maximize user control.
 * **Gaming Ready**: All the power of Bazzite (Steam, Lutris, GameMode) without the bloat.
 * **Hermès Agent (In Development)**: A local, sovereign AI assistant running on Qwen/Hermes, tailored to your hardware. No cloud, no surveillance.
 * **Libertarian Philosophy**: Designed for those who treat their PC as a private sanctuary.
## 🚀 Installation
To rebase your existing Fedora Atomic installation to **LibertarianCoreOS**:
 1. **Rebase to the unsigned image** (to get signing keys):
   ```bash
   rpm-ostree rebase ostree-unverified-registry:ghcr.io/libertariancore/libertariancore:latest
   
   ```
 2. **Reboot**:
   ```bash
   systemctl reboot
   
   ```
 3. **Rebase to the signed image**:
   ```bash
   rpm-ostree rebase ostree-image-signed:ghcr.io/libertariancore/libertariancore:latest
   
   ```
 4. **Final Reboot**:
   ```bash
   systemctl reboot
   
   ```
## 🤖 Hermès Assistant
LibertarianCoreOS features **Hermès**, your local AI collaborator.
Depending on your system specs, the installer will automatically suggest the optimal local model:
 * **8GB RAM**: Qwen 1.5B / 4B
 * **16GB+ RAM**: Qwen 9B / Hermes 2
 * **32GB+ RAM**: Qwen 32B+
## 🛡 Verification
Our images are signed with **Sigstore's cosign**. Verify the signature by running:
```bash
cosign verify --key cosign.pub ghcr.io/libertariancore/libertariancore

```
### 💡 Why the Fox & the Badger?
The **Fox** represents tactical intelligence and the ability to navigate complex systems. The **Honey Badger (Ratel)** represents the raw, offensive defense of one's territory. Together, they form the core of our digital resistance.
